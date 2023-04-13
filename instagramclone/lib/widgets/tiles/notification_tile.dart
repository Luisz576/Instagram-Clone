import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';
import 'package:instagramclone/models/user_notification.dart';
import 'package:instagramclone/widgets/follow_button.dart';
import 'package:instagramclone/widgets/user/user_icon.dart';

class NotificationTile extends StatelessWidget {
  final AppTheme theme;
  final UserNotification notification;
  const NotificationTile({required this.notification, required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
      children: [
          UserIcon(
            user: notification.userStartedFollow,
            size: 20,
          ),
          const SizedBox(width: 10,),
          Text(notification.userStartedFollow.username,
            style: TextStyle(
              color: theme.primaryTextColor,
              fontWeight: FontWeight.w700
            ),
          ),
          Text(" started following you.",
            style: TextStyle(
              color: theme.primaryTextColor,
            ),
          ),
          const SizedBox(width: 5,),
          Followbutton(theme: theme,)
        ],
      ),
    );
  }
}