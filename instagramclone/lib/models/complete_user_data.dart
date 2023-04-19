import 'package:instagramclone/models/user.dart';

class CompleteUserData extends User{
  final int posts, followers, following;
  CompleteUserData(super.id, super.username, super.imageUrl, this.posts, this.followers, this.following);

  factory CompleteUserData.withUser({required User user, required int posts, required int followers, required int following}){
    return CompleteUserData(user.id, user.username, user.imageUrl, posts, followers, following);
  }
}