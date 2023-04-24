import 'package:flutter/material.dart';
import 'package:instagramclone/models/story_post.dart';

class StoryViewWidgetTile extends StatelessWidget {
  final StoryPost story;
  const StoryViewWidgetTile({required this.story, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.network(story.imageUrl),
    );
  }
}