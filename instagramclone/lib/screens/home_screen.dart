import 'package:flutter/material.dart';
import 'package:instagramclone/services/api.dart';
import 'package:instagramclone/widgets/insta_bottom_bar.dart';
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
    return ChangeNotifierProvider(
      create: (context) => Api.auth.userRepository,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            
          ),
          body: TabBarView(
            controller: controller,
            children: const [
              Icon(Icons.directions_car),
              Icon(Icons.not_interested_rounded),
              Icon(Icons.not_interested_rounded),
              Icon(Icons.not_interested_rounded),
              Icon(Icons.desktop_windows),
            ],
          ),
          bottomNavigationBar: InstaBottomBar(controller: controller),
        ),
      ),
    );
  }
}