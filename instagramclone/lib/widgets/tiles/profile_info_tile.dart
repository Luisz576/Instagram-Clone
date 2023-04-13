import 'package:flutter/material.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title, subtitle;
  const ProfileInfoTile({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    //TODO:
    return Column(
      children: [
        Text(title),
        Text(subtitle)
      ],
    );
  }
}