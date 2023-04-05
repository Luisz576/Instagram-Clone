import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class AppConfig extends HiveObject{
  @HiveField(0)
  final bool isLight;

  AppConfig(this.isLight);
}