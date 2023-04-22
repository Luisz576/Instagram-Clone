import 'package:flutter/material.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/screens/story_view_screen.dart';

void openStory(BuildContext context, Story story){
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => StoryViewScreen(story: story),
  ));
}