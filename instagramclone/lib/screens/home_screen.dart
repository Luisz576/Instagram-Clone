import 'package:flutter/material.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/screens/notifications_screen.dart';
import 'package:instagramclone/services/api.dart';
import 'package:instagramclone/tabs/main_tab.dart';
import 'package:instagramclone/tabs/profile_tab.dart';
import 'package:instagramclone/widgets/insta_bottom_bar.dart';
import 'package:instagramclone/widgets/insta_icon_action.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }
  
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ChangeNotifierProvider(
        create: (context) => Api.auth.userRepository,
        child: DefaultTabController(
          length: 5,
          child: AppWithScaffold(controller: controller),
        ),
      ),
    );
  }
}

class AppWithScaffold extends StatelessWidget {
  final TabController controller;
  const AppWithScaffold({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final themeRepository = context.watch<ThemeRepository>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Image.network(themeRepository.theme.instagramLogoUrl, width: 100),
        actions: [
          InstaIconAction(
              icon: Icons.favorite_outline,
              color: themeRepository.theme.primaryTextColor,
              size: 25,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NotificationsScreen(theme: themeRepository.theme,)
                ));
              },
            ),
          InstaIconAction(
            icon: Icons.send_outlined,
            color: themeRepository.theme.primaryTextColor,
            size: 25,
            onPressed: (){
              // JUST FOR TEST
              print("Apenas para testes");
              themeRepository.setLight(!themeRepository.isLight);
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: controller,
        children: [
          const MainTab(),
          Icon(Icons.not_interested_rounded, color: themeRepository.theme.primaryTextColor,),
          Icon(Icons.not_interested_rounded, color: themeRepository.theme.primaryTextColor,),
          Icon(Icons.not_interested_rounded, color: themeRepository.theme.primaryTextColor,),
          const ProfileTab(),
        ],
      ),
      backgroundColor: themeRepository.theme.primaryColor,
      bottomNavigationBar: InstaBottomBar(controller: controller),
    );
  }
}