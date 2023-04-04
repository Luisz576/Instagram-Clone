import 'package:flutter/material.dart';
import 'package:instagramclone/models/story.dart';
import 'package:instagramclone/screens/home_screen.dart';
import 'package:instagramclone/widgets/story_user.dart';

void main() {
  runApp(MaterialApp(
    home: StoryUser(
      radius: 10,
      story: Story(
        "2324234324234",
        "https://postmuseapp.com/wp-content/uploads/2018/12/HAPPY-BIRTHDAY-Instagram-Story-Template-LRmyYPOet5TjH3oQnP4-576x1024.png"
      ),
    ),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}