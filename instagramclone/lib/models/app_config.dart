import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class AppConfig extends HiveObject{
  @HiveField(0)
  bool isLight;

  AppConfig({required this.isLight});
}