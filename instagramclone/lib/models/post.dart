import 'package:instagramclone/models/user.dart';

class Post{
  final User user;
  final String imageUrl, description;

  Post(this.user ,this.imageUrl, this.description);
}