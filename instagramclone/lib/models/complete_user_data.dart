import 'package:instagramclone/models/user.dart';

class CompleteUserData extends User{
  //TODO:
  CompleteUserData(super.id, super.username, super.imageUrl);

  factory CompleteUserData.withUser({required User user}){
    return CompleteUserData(user.id, user.username, user.imageUrl);
  }
}