import 'package:flutter/material.dart';
import 'package:instagramclone/models/story.dart';

class StoryUser extends StatelessWidget {
  final Story story;
  final Color? backgroundColor;
  final ImageProvider? forcedImage;
  final double? radius;

  const StoryUser({required this.story, this.radius, this.backgroundColor, this.forcedImage, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      backgroundImage: forcedImage ?? NetworkImage(story.userImageUrl),
      radius: radius,
    );
  }
}