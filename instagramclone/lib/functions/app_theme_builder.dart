import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';

class AppThemeBuilder{
  AppTheme buildLight(){
    return AppTheme(
      primaryColor: Colors.white,
      primaryTextColor: Colors.black,
      secundaryColor: Colors.red[600]!,
      accentColor: Colors.blue,
      instagramLogoUrl: "https://logosmarcas.net/wp-content/uploads/2020/04/Instagram-Logo.png"
    );
  }

  AppTheme buildDark(){
    return AppTheme(
      primaryColor: Colors.black,
      primaryTextColor: Colors.white,
      secundaryColor: Colors.red[600]!,
      accentColor: Colors.blue,
      instagramLogoUrl: "https://www.pngkey.com/png/full/1-13459_instagram-font-logo-white-png-instagram-white-text.png"
    );
  }
}