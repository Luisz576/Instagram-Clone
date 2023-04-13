import 'package:flutter/material.dart';
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
            //TODO:
            // const SizedBox(width: 40,),
            // ProfileInfoTile(
            //   title: "132",
            //   subtitle: "Posts",
            // ),
            // const SizedBox(width: 40,),
            // ProfileInfoTile(
            //   title: "132",
            //   subtitle: "Posts",
            // ),
            // const SizedBox(width: 40,),
            // ProfileInfoTile(
            //   title: "132",
            //   subtitle: "Posts",
            // ),
          ],
        ),
      ],
    );
  }
}