import 'dart:collection';

import 'package:instagramclone/models/story_post.dart';

class Story{
  bool _deleted = false;
  String _imageUrl;

  final List<StoryPost> _posts = [];
  final String userId;

  bool get deleted => _deleted;
  String get imageUrl => _imageUrl;
  UnmodifiableListView<StoryPost> get posts => UnmodifiableListView(_posts);

  Story(this.userId, this._imageUrl);

  delete(){
    _deleted = true;
  }

  update(Story story){
    if(story == this){
      _imageUrl = story.imageUrl;
      _posts.clear();
      _posts.addAll(story.posts);
    }
  }

  @override
  bool operator ==(Object other){
    if(other is Story){
      return userId == other.userId;
    }
    return false;
  }

  StoryPost createPost(String imageUrl){
    return StoryPost(this, imageUrl);
  }
}