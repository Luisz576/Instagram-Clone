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
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ChangeNotifierProvider(
        create: (context) => Api.auth.userRepository,
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Consumer<ThemeRepository>(
                builder: (context, themeRepository, child) =>
                  Image.network(themeRepository.theme.instagramLogoUrl, width: 100),
              ),
              actions: [
                Consumer<ThemeRepository>(
                  builder: (context, themeRepository, child) =>
                    InstaIconAction(
                      icon: Icons.favorite_outline,
                      color: themeRepository.theme.primaryTextColor,
                      size: 25,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => NotificationsScreen(theme: themeRepository.theme,)
                        ));
                      },
                    )
                ),
                Consumer<ThemeRepository>(
                  builder: (context, themeRepository, child) =>
                    InstaIconAction(
                      icon: Icons.send_outlined,
                      color: themeRepository.theme.primaryTextColor,
                      size: 25
                    )
                ),
              ],
            ),
            body: TabBarView(
              controller: controller,
              children: const [
                MainTab(),
                Icon(Icons.not_interested_rounded),
                Icon(Icons.not_interested_rounded),
                Icon(Icons.not_interested_rounded),
                ProfileTab(),
              ],
            ),
            bottomNavigationBar: InstaBottomBar(controller: controller),
          ),
        ),
      ),
    );
  }
}