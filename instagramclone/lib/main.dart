import 'package:flutter/material.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/screens/home_screen.dart';
import 'package:instagramclone/services/database.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Database.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Database.instance.loadConfig(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ChangeNotifierProvider(
              create: (context) => ThemeRepository(snapshot.data!.isLight),
              child: const HomeScreen(),
            );
          }
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}