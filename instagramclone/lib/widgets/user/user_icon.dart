import 'package:flutter/material.dart';
import 'package:instagramclone/models/user.dart';

class UserIcon extends StatelessWidget {
  final User? user;
  final double? size;
  const UserIcon({required this.user, this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      backgroundImage: NetworkImage(user == null ?
        "https://cdn.picpng.com/person/person-individually-alone-icon-49284.png"
        : user!.imageUrl
      ),
      radius: size ?? 10,
    );
  }
}