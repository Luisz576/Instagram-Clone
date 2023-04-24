import 'dart:collection';

import 'package:instagramclone/models/story_post.dart';
import 'package:instagramclone/models/user.dart';

class Story{
  bool _deleted = false;

  final List<StoryPost> _posts = [];
  final User user;

  bool get deleted => _deleted;
  bool get isEmpty => _posts.isEmpty;
  String get userImageUrl => user.imageUrl;
  UnmodifiableListView<StoryPost> get posts => UnmodifiableListView(_posts);
  int get length => _posts.length;

  StoryPost get(int index) => _posts[index];

  Story(this.user);
  factory Story.withPosts({required User user, required List<String> stories}){
    final story = Story(user);
    for(String s in stories){
      story.createStory(s);
    }
    return story;
  }

  delete(){
    _deleted = true;
  }

  update(Story story){
    if(story.user.id == user.id){
      _posts.clear();
      _posts.addAll(story.posts);
    }
  }

  createStory(String imageUrl){
    _posts.add(StoryPost(this, imageUrl));
  }
}