import 'package:instagramclone/models/post.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/models/user.dart';

class CompleteUserData extends User{
  final int posts, followers, following;
  final String profession, description;
  final List<Post> userPosts;
  final Story story;
  CompleteUserData(super.id, super.username, super.imageUrl, this.posts, this.followers, this.following, this.profession, this.description, this.userPosts, this.story);

  factory CompleteUserData.withUser({required Story story, required User user, required int posts, required int followers, required int following, required String profession, required String description, required List<Post> userPosts}){
    return CompleteUserData(user.id, user.username, user.imageUrl, posts, followers, following, profession, description, userPosts, story);
  }
}