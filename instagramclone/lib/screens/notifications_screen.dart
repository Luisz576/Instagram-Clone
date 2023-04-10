import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';
import 'package:instagramclone/tabs/notifications_tab.dart';
import 'package:instagramclone/widgets/insta_icon_action.dart';

class NotificationsScreen extends StatelessWidget {
  final AppTheme theme;
  const NotificationsScreen({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InstaIconAction(
          color: theme.primaryTextColor,
          size: 30,
          icon: Icons.arrow_back,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Notifications",
          style: TextStyle(
            color: theme.primaryTextColor,
            fontSize: 20
          ),
        ),
      ),
      body: NotificationsTab(theme: theme,),
    );
  }
}