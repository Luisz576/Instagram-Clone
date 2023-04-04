import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:instagramclone/models/story.dart';

class StoriesRepositories extends ChangeNotifier{
  final List<Story> _stories = [];

  UnmodifiableListView<Story> get stories => UnmodifiableListView(_stories);

  update(List<Story> stories){
    for(Story story in stories){
      if(_stories.contains(story)){
        if(story.deleted){
          _stories.remove(story);
          continue;
        }
        _stories[_stories.indexOf(story)].update(story);
        continue;
      }
      _stories.add(story);
    }
  }
}