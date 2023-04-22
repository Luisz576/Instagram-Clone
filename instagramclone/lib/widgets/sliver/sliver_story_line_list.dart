import 'package:flutter/material.dart';
import 'package:instagramclone/functions/open_story.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/services/api.dart';
import 'package:instagramclone/widgets/tiles/story_tile.dart';
import 'package:provider/provider.dart';

class SliverStoryLineList extends StatelessWidget {
  const SliverStoryLineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeRepository>(
      builder: (context, themeRepository, child) => FutureBuilder(
        future: Api.loadStories(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Story> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => StoryTile(
                story: data[index],
                onTap: () => openStory(context, data[index]),
              ),
            );
          }
          return CircularProgressIndicator(
            color: themeRepository.theme.primaryTextColor
          );
        },
      ),
    );
  }
}