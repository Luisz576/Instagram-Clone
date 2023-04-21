import 'package:flutter/material.dart';

sendToastMessage(BuildContext context, String message, {duration = const Duration(seconds: 1), Color? color}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: duration,
    backgroundColor: color,
  ));
}