import 'package:hive/hive.dart';
import 'package:instagramclone/models/app_config.dart';

class AppConfigAdapter extends TypeAdapter<AppConfig>{
  @override
  AppConfig read(BinaryReader reader){
    return AppConfig(reader.readBool());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, AppConfig obj) {
    writer.writeBool(obj.isLight);
  }
}