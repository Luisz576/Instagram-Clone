import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/widgets/user/story_user.dart';
import 'package:provider/provider.dart';

class StoryTile extends StatelessWidget {
  final Story? story;
  final double? radius;
  final bool showUsername;
  final Function()? onTap;
  const StoryTile({required this.story, this.showUsername = false, this.radius, this.onTap, super.key});

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
    return showUsername ?
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _StoryTileWidget(
            onTap: onTap,
            radius: radius,
            story: story,
          ),
          const SizedBox(
            height: 5,
          ),
          Consumer<ThemeRepository>(
            builder: (context, themeRepository, child) => Text(story!.user.username,
              style: GoogleFonts.roboto(
                color: themeRepository.theme.primaryTextColor,
                fontSize: 14
              ),
            ),
          )
        ],
      )
    : _StoryTileWidget(
      onTap: onTap,
      radius: radius,
      story: story,
    );
  }
}

class _StoryTileWidget extends StatelessWidget {
  final Story? story;
  final double? radius;
  final Function()? onTap;
  const _StoryTileWidget({required this.story, required this.radius, required this.onTap});

  @override
  Widget build(BuildContext context) {
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