import 'package:flutter/material.dart';
import 'package:instagramclone/models/complete_user_data.dart';
import 'package:instagramclone/repositories/user_repository.dart';
import 'package:instagramclone/services/api.dart';
import 'package:instagramclone/widgets/tiles/post_tile.dart';
import 'package:instagramclone/widgets/tiles/story_tile.dart';
import 'package:instagramclone/widgets/user/profile_info.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserRepository>(
      builder: (context, userRepository, child){
        if(userRepository.user == null){
          return const Center(
            child: Text("Realize seu Login"),
          );
        }
        return FutureBuilder(
          future: Api.getCompleteUserData(userRepository.user!.id),
          builder: (context, snapshot){
            if(snapshot.hasData){
              CompleteUserData data = snapshot.data!;
              return CustomScrollView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: ProfileInfo(
                        userData: data,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 20),
                    sliver: SliverToBoxAdapter(
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          itemCount: 7,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(left: 10),
                            //MOCKADO
                            child: StoryTile(
                              story: index == 0 ? data.story : null,
                              radius: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => PostTile(post: data.userPosts[index]),
                        childCount: data.userPosts.length,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3
                      ),
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}