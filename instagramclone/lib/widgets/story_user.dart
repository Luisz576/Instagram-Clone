import 'package:flutter/material.dart';
import 'package:instagramclone/models/story.dart';

class StoryUser extends StatelessWidget {
  final Story story;
  final double? radius;

  const StoryUser({required this.story, this.radius, super.key});

  _openStories(){
    //TODO:
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openStories,
      child: CircleAvatar(
        backgroundImage: NetworkImage(story.imageUrl),
        foregroundColor: Colors.green,
        radius: radius,
      ),
    );
  }
}