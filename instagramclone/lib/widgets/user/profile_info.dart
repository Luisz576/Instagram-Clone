import 'package:flutter/material.dart';
import 'package:instagramclone/extensions/post_number_formater.dart';
import 'package:instagramclone/models/complete_user_data.dart';
import 'package:instagramclone/widgets/tiles/profile_info_tile.dart';
import 'package:instagramclone/widgets/user/user_icon.dart';

class ProfileInfo extends StatelessWidget {
  final CompleteUserData userData;
  const ProfileInfo({required this.userData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            UserIcon(
              user: userData,
              size: 40,
            ),
            const SizedBox(width: 35,),
            ProfileInfoTile(
              title: userData.posts.postNumberFormat(),
              subtitle: "Posts",
            ),
            const SizedBox(width: 35,),
            ProfileInfoTile(
              title: userData.followers.postNumberFormat(),
              subtitle: "Followers",
            ),
            const SizedBox(width: 35,),
            ProfileInfoTile(
              title: userData.following.postNumberFormat(),
              subtitle: "Following",
            ),
          ],
        ),
      ],
    );
  }
}