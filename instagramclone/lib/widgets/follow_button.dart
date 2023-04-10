import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';

class Followbutton extends StatelessWidget {
  final AppTheme theme;
  const Followbutton({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(theme.accentColor)
      ),
      onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Text("Follow",
          style: TextStyle(
            color: theme.primaryTextColor
          )
        ),
      )
    );
  }
}