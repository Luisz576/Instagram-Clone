import 'package:flutter/material.dart';
import 'package:instagramclone/functions/open_story.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/services/api.dart';
import 'package:instagramclone/widgets/tiles/story_tile.dart';
import 'package:provider/provider.dart';

class StoryLineList extends StatelessWidget {
  const StoryLineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeRepository>(
      builder: (context, themeRepository, child) => FutureBuilder(
        future: Api.loadStories(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Story> data = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.only(right: 20),
              itemCount: data.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: StoryTile(
                  story: data[index],
                  radius: 30,
                  onTap: () => openStory(context, data, startAt: index),
                  showUsername: true,
                ),
              ),
            );
          }
          return CircularProgressIndicator(
            color: themeRepository.theme.primaryTextColor,
          );
        },
      ),
    );
  }
}