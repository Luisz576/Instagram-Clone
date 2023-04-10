import 'package:flutter/material.dart';
import 'package:instagramclone/functions/send_toast_message.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/repositories/user_repository.dart';
import 'package:instagramclone/screens/photo_view_screen.dart';
import 'package:instagramclone/services/database.dart';
import 'package:instagramclone/widgets/user_icon.dart';
import 'package:provider/provider.dart';

class InstaBottomBar extends StatefulWidget {
  final TabController controller;
  const InstaBottomBar({required this.controller, super.key});

  @override
  State<InstaBottomBar> createState() => _InstaBottomBarState();
}

class _InstaBottomBarState extends State<InstaBottomBar> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeRepository>(
      builder: (context, themeRepository, child){
        return BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontSize: 0),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined, color: themeRepository.theme.primaryTextColor,),
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Icon(_currentIndex == 1 ? Icons.search : Icons.search_outlined, color: themeRepository.theme.primaryTextColor,), 
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined, color: themeRepository.theme.primaryTextColor,), 
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Icon(_currentIndex == 3 ? Icons.video_library : Icons.video_library_outlined, color: themeRepository.theme.primaryTextColor,), 
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Consumer<UserRepository>(
                builder: (context, user, child){
                  return UserIcon(user: user.user);
                },
              ), 
              label: "",
            ),
          ],
          onTap: (index){
            if(index == 2){
              Database.instance.pickImage().then((xfile) async{
                if(xfile == null){
                  sendToastMessage(context, "Nenhuma imagem selecionada!");
                  return;
                }
                
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PhotoViewScreen(photo: xfile.path))
                );
              }).onError((_, __){
                sendToastMessage(context, "Erro ao carregar imagem!");
              });
              return;
            }
            setState(() {
              _currentIndex = index;
              widget.controller.animateTo(index);
            });
          },
          backgroundColor: themeRepository.theme.primaryColor,
        );
      }
    );
  }
}