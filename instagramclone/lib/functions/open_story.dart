import 'package:flutter/material.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/screens/story_view_screen.dart';

void openStory(BuildContext context, List<Story> stories, { int startAt = 0 }){
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => StoryViewScreen(stories: stories,
      startIndex: startAt
    ),)
  );
}