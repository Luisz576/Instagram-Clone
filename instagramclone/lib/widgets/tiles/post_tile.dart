import 'package:flutter/material.dart';
import 'package:instagramclone/models/post.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/screens/photo_view_screen.dart';
import 'package:provider/provider.dart';

class PostTile extends StatelessWidget {
  final Post post;
  const PostTile({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeRepository themeRepository = context.watch<ThemeRepository>();
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PhotoViewScreen(photo: post.imageUrl, isNetwork: true),
        ));
      },
      child: Container(
        color: themeRepository.theme.gridColor,
        child: Image.network(post.imageUrl),
      ),
    );
  }
}