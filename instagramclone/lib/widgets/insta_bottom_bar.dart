import 'package:flutter/material.dart';
import 'package:instagramclone/functions/send_toast_message.dart';
import 'package:instagramclone/models/app_theme.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/repositories/user_repository.dart';
import 'package:instagramclone/screens/login_screen.dart';
import 'package:instagramclone/screens/photo_view_screen.dart';
import 'package:instagramclone/services/database.dart';
import 'package:instagramclone/widgets/user/user_icon.dart';
import 'package:provider/provider.dart';

class InstaBottomBar extends StatefulWidget {
  final TabController controller;
  const InstaBottomBar({required this.controller, super.key});

  @override
  State<InstaBottomBar> createState() => _InstaBottomBarState();
}

class _InstaBottomBarState extends State<InstaBottomBar> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  BuildContext? _context;
  AppTheme? _theme;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  _listener(){
    if(widget.controller.index == 4){
      UserRepository userRepository = context.read<UserRepository>();
      if(userRepository.user == null){
        if(_context != null){
          Navigator.push(_context!, MaterialPageRoute(
            builder: (context) => LoginScreen(theme: _theme!),
          ));
        }
      }
    }
    _selectPage(widget.controller.index);
  }

  _selectPage(int index){
    setState(() {
      _currentIndex = index;
      widget.controller.animateTo(index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Consumer<ThemeRepository>(
      builder: (context, themeRepository, child){
        _theme = themeRepository.theme;
        return BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedLabelStyle: const TextStyle(fontSize: 0),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined, color: themeRepository.theme.primaryTextColor,),
              label: ""
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(_currentIndex == 1 ? Icons.search : Icons.search_outlined, color: themeRepository.theme.primaryTextColor,), 
              label: ""
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.add_box_outlined, color: themeRepository.theme.primaryTextColor,), 
              label: ""
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(_currentIndex == 3 ? Icons.video_library : Icons.video_library_outlined, color: themeRepository.theme.primaryTextColor,), 
              label: ""
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Consumer<UserRepository>(
                builder: (context, user, child) => UserIcon(user: user.user),
              ), 
              label: "",
            ),
          ],
          onTap: (index){
            if(index == 2){
              Database.instance.pickImage().then((xfile) async{
                if(xfile == null){
                  sendToastMessage(context, "Nenhuma imagem selecionada!", color: themeRepository.theme.accentColor);
                  return;
                }
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PhotoViewScreen(photo: xfile.path))
                );
              }).onError((_, __){
                sendToastMessage(context, "Erro ao carregar imagem!", color: themeRepository.theme.accentColor);
              });
              return;
            }
            if(index == 4){
              UserRepository userRepository = context.read<UserRepository>();
              if(userRepository.user == null){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginScreen(theme: themeRepository.theme,),
                ));
                return;
              }
            }
            _selectPage(index);
          },
        );
      }
    );
  }
}