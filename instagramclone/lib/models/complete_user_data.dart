import 'package:instagramclone/models/user.dart';

class CompleteUserData extends User{
  final int posts, followers, following;
  final String profession, description;
  CompleteUserData(super.id, super.username, super.imageUrl, this.posts, this.followers, this.following, this.profession, this.description);

  factory CompleteUserData.withUser({required User user, required int posts, required int followers, required int following, required String profession, required String description}){
    return CompleteUserData(user.id, user.username, user.imageUrl, posts, followers, following, profession, description);
  }
}