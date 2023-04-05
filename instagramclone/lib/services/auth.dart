import 'package:instagramclone/repositories/user_repository.dart';
import 'package:instagramclone/services/api.dart';

class Authentication{
  final UserRepository _userRepository = UserRepository();

  UserRepository get userRepository => _userRepository;

  // MOCKADO
  Future login(String username) async{
    _userRepository.login(await Api.getUserById("t3t43tt4th"));
  }
}