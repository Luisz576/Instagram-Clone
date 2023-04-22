import 'package:flutter/material.dart';
import 'package:instagramclone/widgets/sliver/sliver_story_line_list.dart';

class MainTab extends StatelessWidget {
  const MainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SliverStoryLineList(),
        ),
        
      ],
    );
  }
}