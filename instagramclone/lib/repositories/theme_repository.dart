import 'package:flutter/material.dart';
import 'package:instagramclone/functions/app_theme_builder.dart';
import 'package:instagramclone/models/app_config.dart';
import 'package:instagramclone/models/app_theme.dart';
import 'package:instagramclone/services/database.dart';

class ThemeRepository extends ChangeNotifier{
  bool _isLight;
  bool  get isLight => _isLight;

  late final AppTheme _lightTheme, _darkTheme;

  AppTheme get theme => _isLight ? _lightTheme : _darkTheme;

  ThemeRepository(this._isLight){
    AppThemeBuilder builder = AppThemeBuilder();
    _lightTheme = builder.buildLight();
    _darkTheme = builder.buildDark();
  }

  setLight(bool isLight){
    _isLight = isLight;
    Database.instance.changeConfig(AppConfig(isLight: isLight));
    notifyListeners();
  }
}