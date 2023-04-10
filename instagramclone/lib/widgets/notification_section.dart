import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';
import 'package:instagramclone/models/user_notification.dart';
import 'package:instagramclone/widgets/tiles/notification_tile.dart';

class NotificationSection extends StatelessWidget {
  final AppTheme theme;
  final List<UserNotification> notifications;
  final String title;
  const NotificationSection({required this.theme, required this.title, required this.notifications, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: TextStyle(
            color: theme.primaryTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        ...notifications.map((notification) => NotificationTile(notification: notification, theme: theme,)).toList(),
        const SizedBox(height: 20,)
      ],
    );
  }
}