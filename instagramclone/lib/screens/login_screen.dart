import 'package:flutter/material.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/services/api.dart';
import 'package:instagramclone/services/database.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Database.instance.loadConfig(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ChangeNotifierProvider(
            create: (context) => ThemeRepository(snapshot.data!.isLight),
            child: Scaffold(
              body: Center(
                child: Consumer<ThemeRepository>(
                  builder: (context, themeRepository, child) => TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(themeRepository.theme.secundaryColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: Text("Login",
                        style: TextStyle(
                          color: themeRepository.theme.primaryColor,
                          fontSize: 20
                        ),
                    ),
                    ),
                    onPressed: () {
                      Api.auth.login("Insta").then((value){
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(color: Colors.blue),
        );
      },
    );
  }
}