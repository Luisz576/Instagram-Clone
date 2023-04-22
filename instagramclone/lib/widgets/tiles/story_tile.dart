import 'package:flutter/material.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/widgets/user/story_user.dart';
import 'package:provider/provider.dart';

class StoryTile extends StatelessWidget {
  final Story? story;
  final double? radius;
  final Function()? onTap;
  const StoryTile({required this.story, this.radius, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    if(story == null || story!.isEmpty){
      final ThemeRepository themeRepository = context.watch<ThemeRepository>();
      return CircleAvatar(
          backgroundColor: themeRepository.theme.gridColor,
          radius: radius,
          child: Icon(Icons.add, color: themeRepository.theme.primaryColor),
        );
    }
    return GestureDetector(
      onTap: onTap,
      child: StoryUser(
        story: story!,
        backgroundColor: Colors.transparent,
        forcedImage: NetworkImage(story!.posts[story!.posts.length - 1].imageUrl),
        radius: radius,
      ),
    );
  }
}