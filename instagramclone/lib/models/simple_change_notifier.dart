import 'package:flutter/material.dart';

class SimpleChangeNotifier<T> extends ChangeNotifier{
  T _v;

  SimpleChangeNotifier(this._v);

  T get value => _v;
  set value(T value){
    _v = value;
    notifyListeners();
  }
}