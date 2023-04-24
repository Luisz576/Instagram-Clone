import 'package:flutter/material.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/widgets/sliver/story_line_list.dart';
import 'package:provider/provider.dart';

class MainTab extends StatelessWidget {
  const MainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeRepository>(
      builder: (context, themeRepository, child) => CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 85,
                child: StoryLineList(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 0.2,
              child: Container(
                color: themeRepository.theme.gridColor,
              )
            ),
          ),
          //TODO: POSTS
        ],
      ),
    );
  }
}