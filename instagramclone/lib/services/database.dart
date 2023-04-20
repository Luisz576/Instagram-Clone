import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagramclone/models/adapters/app_config_adapter.dart';
import 'package:instagramclone/models/app_config.dart';

class Database{
  static late final Database instance;

  bool _setuped = false;
  bool get setuped => _setuped;

  late Box<AppConfig> _hiveDb;

  late final ImagePicker imagePicker;

  static init() async{
    await Hive.initFlutter();
    Hive.registerAdapter(AppConfigAdapter());
    instance = Database._();
  }

  Database._(){
    Hive.openBox<AppConfig>('configs').then((box){
      _hiveDb = box;
      _setuped = true;
    }).onError((error, stackTrace){
      print(error);
      print("Erro ao inicializar banco de dados");
    });
    imagePicker = ImagePicker();
  }

  Future<AppConfig> loadConfig({int r = 0}) async{
    if(_setuped){
      List<AppConfig> configs = List.unmodifiable(_hiveDb.values);
      return configs.isEmpty ? await _createConfig() : configs[0];
    }
    if(r == 10){
      return AppConfig(isLight: true);
    }
    await Future.delayed(const Duration(milliseconds: 200));
    return loadConfig(r: r + 1);
  }

  changeConfig(AppConfig appConfig){
    _hiveDb.clear();
    _createConfig(defaultConfig: appConfig);
  }

  Future<AppConfig> _createConfig({AppConfig? defaultConfig}) async{
    AppConfig config = defaultConfig ?? AppConfig(isLight: true);
    await _hiveDb.add(config);
    return config;
  }

  Future<XFile?> pickImage() {
    return imagePicker.pickImage(source: ImageSource.gallery);
  }
}