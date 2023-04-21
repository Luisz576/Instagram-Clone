import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';
import 'package:instagramclone/services/api.dart';

class LoginScreen extends StatelessWidget {
  final AppTheme theme;
  const LoginScreen({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(theme.accentColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text("Login",
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 20
                ),
              ),
            ),
            onPressed: () {
              Api.auth.login("Insta").then((value){
                Navigator.pop(context);
              });
            },
          ),
      ),
      backgroundColor: theme.primaryColor,
    );
  }
}