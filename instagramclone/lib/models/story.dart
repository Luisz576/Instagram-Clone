import 'dart:collection';

import 'package:instagramclone/models/story_post.dart';
import 'package:instagramclone/models/user.dart';

class Story{
  bool _deleted = false;

  final List<StoryPost> _posts = [];
  final User user;

  bool get deleted => _deleted;
  String get userImageUrl => user.imageUrl;
  UnmodifiableListView<StoryPost> get posts => UnmodifiableListView(_posts);

  Story(this.user);

  delete(){
    _deleted = true;
  }

  update(Story story){
    if(story == this){
      _posts.clear();
      _posts.addAll(story.posts);
    }
  }

  @override
  bool operator ==(Object other){
    if(other is Story){
      return user.id == other.user.id;
    }
    return false;
  }

  createStory(String imageUrl){
    _posts.add(StoryPost(this, imageUrl));
  }
}