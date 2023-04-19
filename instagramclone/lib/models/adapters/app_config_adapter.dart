import 'package:hive/hive.dart';
import 'package:instagramclone/models/app_config.dart';

class AppConfigAdapter extends TypeAdapter<AppConfig>{
  @override
  AppConfig read(BinaryReader reader){
    return AppConfig(
      isLight: reader.readBool()
      // fontSize
      // fontFamily
      // [...]
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, AppConfig obj) {
    writer.writeBool(obj.isLight);
  }
}