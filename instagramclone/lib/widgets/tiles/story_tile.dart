import 'package:flutter/material.dart';
import 'package:instagramclone/models/story_post.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:provider/provider.dart';

class StoryTile extends StatelessWidget {
  final StoryPost? story;
  final double? radius;
  final Function()? onTap;
  const StoryTile({required this.story, this.radius, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    if(story == null){
      final ThemeRepository themeRepository = context.watch<ThemeRepository>();
      return CircleAvatar(
          backgroundColor: themeRepository.theme.gridColor,
          radius: radius,
          child: Icon(Icons.add, color: themeRepository.theme.primaryColor),
        );
    }
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(story!.imageUrl),
        radius: radius,
      ),
    );
  }
}