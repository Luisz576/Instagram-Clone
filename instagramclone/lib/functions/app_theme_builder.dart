import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';

class AppThemeBuilder{
  AppTheme buildLight(){
    return AppTheme(
      primaryColor: Colors.white,
      primaryTextColor: Colors.black,
      secundaryColor: Colors.red[600]!,
    );
  }

  AppTheme buildDark(){
    return AppTheme(
      primaryColor: Colors.black,
      primaryTextColor: Colors.white,
      secundaryColor: Colors.red[600]!,
    );
  }
}