import 'package:flutter/material.dart';

class InstaIconAction extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final Function()? onPressed;
  const InstaIconAction({required this.icon, required this.color, required this.size, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
        size: size,
      )
    );
  }
}