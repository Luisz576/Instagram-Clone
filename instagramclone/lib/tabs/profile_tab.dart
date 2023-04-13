import 'package:flutter/material.dart';
import 'package:instagramclone/repositories/user_repository.dart';
import 'package:instagramclone/services/api.dart';
import 'package:instagramclone/widgets/user/profile_info.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserRepository>(
      builder: (context, userRepository, child){
        if(userRepository.user == null){
          return const Center(
            child: Text("Realize seu Login"),
          );
        }
        return FutureBuilder(
          future: Api.getCompleteUserData(userRepository.user!.id),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView(
                children: [
                  ProfileInfo(
                    userData: snapshot.data!,
                  ),

                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}