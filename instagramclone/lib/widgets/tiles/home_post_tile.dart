import 'package:flutter/material.dart';
import 'package:instagramclone/models/app_theme.dart';
import 'package:instagramclone/models/post.dart';
import 'package:instagramclone/widgets/row_post_actions.dart';
import 'package:instagramclone/widgets/user/user_icon.dart';

class HomePostTile extends StatelessWidget {
  final Post post;
  final AppTheme theme;
  const HomePostTile({required this.post, required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 10,),
            UserIcon(
              user: post.user,
              size: 20,
            ),
            const SizedBox(width: 15,),
            Text(post.user.username,
              style: TextStyle(
                color: theme.primaryTextColor
              ),
            )
          ],
        ),
        const SizedBox(height: 10,),
        Image.network(post.imageUrl,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 40
          ),
          child: RowPostActions(
            theme: theme,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 40
          ),
          child: Text(post.description,
            style: TextStyle(
              color: theme.primaryTextColor
            ),
          ),
        )
      ],
    );
  }
}