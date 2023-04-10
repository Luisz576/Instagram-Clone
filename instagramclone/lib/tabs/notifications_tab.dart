import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';
import 'package:instagramclone/models/user.dart';
import 'package:instagramclone/models/user_notification.dart';
import 'package:instagramclone/models/user_notification_section.dart';
import 'package:instagramclone/widgets/notification_section.dart';

class NotificationsTab extends StatelessWidget {
  final AppTheme theme;
  final List<UserNotificationSection> sections = [
    UserNotificationSection("New", [
      UserNotification(User(
        "fwetr43r3434",
        "InstaTeste",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      )),
      UserNotification(User(
        "4rfh49h93",
        "TesteDoInsta",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      ))
    ]),
    UserNotificationSection("Today", [
      UserNotification(User(
        "g45g45ggege",
        "Username",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      ))
    ]),
    UserNotificationSection("This Week", [
      UserNotification(User(
        "3g4g45g45g4",
        "User123_",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      )),
      UserNotification(User(
        "g45g45g4ggt",
        "User434_",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      )),
      UserNotification(User(
        "34ggegeherth5",
        "23423rA",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      )),
      UserNotification(User(
        "gergerg54gt",
        "Error404",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      ))
    ]),
    UserNotificationSection("This Month", [
      UserNotification(User(
        "45r45rtherher",
        "TesteUser1",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      )),
      UserNotification(User(
        "f34fgg3g33g",
        "ATesteA",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      )),
      UserNotification(User(
        "5g35g5445g4",
        "Username123",
        "https://www.shutterstock.com/image-vector/people-icon-vector-person-sing-260nw-707883430.jpg"
      )),
    ]),
  ];
  NotificationsTab({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: RefreshIndicator(
        onRefresh: () async{
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sections.length,
          itemBuilder: (context, index) => NotificationSection(
            theme: theme,
            title: sections[index].title,
            notifications: sections[index].notifications
          ),
        ),
      ),
    );
  }
}