import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';

class RowPostActions extends StatelessWidget {
  final AppTheme theme;
  const RowPostActions({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.favorite_border,
          color: theme.primaryTextColor,
          size: 25,
        ),
        const SizedBox(
          width: 20,
        ),
        Icon(Icons.chat_bubble_outline_outlined,
          color: theme.primaryTextColor,
          size: 25,
        ),
        const SizedBox(
          width: 20,
        ),
        Icon(Icons.send_outlined,
          color: theme.primaryTextColor,
          size: 25,
        ),
      ],
    );
  }
}