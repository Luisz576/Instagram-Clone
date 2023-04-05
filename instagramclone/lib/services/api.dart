import 'package:instagramclone/models/post.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/models/user.dart';
import 'package:instagramclone/services/auth.dart';

class Api{
  static final Authentication auth = Authentication();

  // MOCKADO
  static Future<List<Post>> loadPosts() async{
    Future.delayed(const Duration(milliseconds: 500));
    return [
      Post(await getUserById("5e345yy54y"),
        "https://image.freepik.com/vecteurs-libre/modele-post-instagram-notifications_23-2147815662.jpg",
        "@insta Postagem teste #insta #clone #teste #dart #flutter"
      ),
      Post(await getUserById("45hg45g454"),
        "https://image.freepik.com/vecteurs-libre/modele-post-instagram-notifications_23-2147815662.jpg",
        "@insta Postagem teste #insta #clone #teste #dart #flutter"
      ),
      Post(await getUserById("t3t43tt4th"),
        "https://image.freepik.com/vecteurs-libre/modele-post-instagram-notifications_23-2147815662.jpg",
        "@insta Postagem teste #insta #clone #teste #dart #flutter"
      ),
      Post(await getUserById("45hg45g454"),
        "https://image.freepik.com/vecteurs-libre/modele-post-instagram-notifications_23-2147815662.jpg",
        "@insta Postagem teste #insta #clone #teste #dart #flutter"
      ),
      Post(await getUserById("5e345yy54y"),
        "https://image.freepik.com/vecteurs-libre/modele-post-instagram-notifications_23-2147815662.jpg",
        "@insta Postagem teste #insta #clone #teste #dart #flutter"
      ),
    ];
  }

  // MOCKADO
  static Future<List<Story>> loadStories() async{
    Future.delayed(const Duration(seconds: 1));
    Story s1 = Story(await getUserById("45hg45g454")),
      s2 = Story(await getUserById("5e345yy54y")),
      s3 = Story(await getUserById("t3t43tt4th"));
    s1.createStory("https://buffer.com/resources/content/images/resources/wp-content/uploads/2019/12/luke-chesser-B_oL3jEt5L4-unsplash.jpg");
    s3.createStory("https://buffer.com/resources/content/images/resources/wp-content/uploads/2019/12/luke-chesser-B_oL3jEt5L4-unsplash.jpg");
    s3.createStory("https://buffer.com/resources/content/images/resources/wp-content/uploads/2019/12/luke-chesser-B_oL3jEt5L4-unsplash.jpg");
    s2.createStory("https://buffer.com/resources/content/images/resources/wp-content/uploads/2019/12/luke-chesser-B_oL3jEt5L4-unsplash.jpg");
    s3.createStory("https://buffer.com/resources/content/images/resources/wp-content/uploads/2019/12/luke-chesser-B_oL3jEt5L4-unsplash.jpg");
    return [s1, s2, s3];
  }

  // MOCKADO
  static Future<User> getUserById(String id) async{
    Future.delayed(const Duration(milliseconds: 500));
    return User(id, "insta", "https://wallpapercave.com/wp/wp4041550.jpg");
  }
}