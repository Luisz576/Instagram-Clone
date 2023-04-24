import 'package:flutter/material.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/widgets/control_story_panel.dart';
import 'package:instagramclone/widgets/tiles/story_view_widget_tile.dart';
import 'package:story/story_page_view.dart';

class StoryViewScreen extends StatelessWidget {
  final List<Story> stories;
  final int startIndex;
  const StoryViewScreen({required this.stories, required this.startIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          StoryPageView(
            initialPage: startIndex,
            itemBuilder: (context, pageIndex, storyIndex) => StoryViewWidgetTile(
                story: stories[pageIndex].posts[storyIndex],
              ),
            storyLength: (index) => stories[index].posts.length,
            pageLength: stories.length,
          ),
          const ControlStoryPanel()
        ],
      ),
    );
  }
}