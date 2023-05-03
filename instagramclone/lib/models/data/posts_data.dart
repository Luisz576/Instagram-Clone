import 'package:flutter/material.dart';
import 'package:instagramclone/models/post.dart';
import 'package:instagramclone/models/simple_change_notifier.dart';
import 'package:instagramclone/services/api.dart';

class PostsData extends ChangeNotifier{
  int _pageCounter = 0;
  int get pageCounter => _pageCounter;

  final List<Post> _posts = [];
  List<Post> get posts => List.unmodifiable(_posts);
  int get lenght => _posts.length;

  final SimpleChangeNotifier<bool> _loading = SimpleChangeNotifier(false);
  bool get isLoading => _loading.value;

  addLoadingListener(void Function() listener){
    _loading.addListener(listener);
  }

  removeLoadingListener(void Function() listener){
    _loading.removeListener(listener);
  }

  load() async{
    if(_loading.value == true){
      return;
    }
    _loading.value = true;
    List<Post> ps = await Api.loadPosts(_pageCounter);
    _pageCounter++;
    _posts.addAll(ps);
    _loading.value = false;
    notifyListeners();
  }
}