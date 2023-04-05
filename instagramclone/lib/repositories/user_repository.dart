import 'package:flutter/material.dart';
import 'package:instagramclone/models/user.dart';

class UserRepository extends ChangeNotifier{
  User? _user;

  User? get user => _user;

  login(User user){
    _user = user;
    notifyListeners();
  }

  logout(){
    _user = null;
    notifyListeners();
  }
}