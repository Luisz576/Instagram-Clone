import 'package:flutter/material.dart';
import 'package:instagramclone/models/data/posts_data.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/widgets/sliver/story_line_list.dart';
import 'package:instagramclone/widgets/tiles/home_post_tile.dart';
import 'package:provider/provider.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  final PostsData _postsData = PostsData();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    _postsData.load();
    super.initState();
  }

  _scrollListener(){
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_postsData.isLoading){
      _postsData.load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeRepository>(
      builder: (context, themeRepository, child) => CustomScrollView(
        shrinkWrap: true,
        controller: _scrollController,
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
          AnimatedBuilder(
            animation: _postsData,
            builder: (context, child) => 
              SliverList.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) => HomePostTile(
                  post: _postsData.posts[index],
                  theme: themeRepository.theme,
                ),
                itemCount: _postsData.lenght,
              )
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  color: themeRepository.theme.primaryTextColor,
                ),
              ),
            ),
          )
          // SliverInfiniteList<PostsData>(
          //   itemBuilder: (context, index, postsData) => HomePostTile(postsData.posts[index]),
          //   itemCount: (postsData) => postsData.lenght,
          //   listenable: PostsData(),
          // )
        ],
      ),
    );
  }
}