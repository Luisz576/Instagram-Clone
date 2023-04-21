import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/extensions/post_number_formater.dart';
import 'package:instagramclone/models/complete_user_data.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:instagramclone/widgets/tiles/profile_info_tile.dart';
import 'package:instagramclone/widgets/user/user_icon.dart';
import 'package:provider/provider.dart';

class ProfileInfo extends StatelessWidget {
  final CompleteUserData userData;
  const ProfileInfo({required this.userData, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeRepository>(
      builder: (context, themeRepository, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              UserIcon(
                user: userData,
                size: 40,
              ),
              const SizedBox(width: 35,),
              ProfileInfoTile(
                title: userData.posts.postNumberFormat(),
                subtitle: "Posts",
              ),
              const SizedBox(width: 35,),
              ProfileInfoTile(
                title: userData.followers.postNumberFormat(),
                subtitle: "Followers",
              ),
              const SizedBox(width: 35,),
              ProfileInfoTile(
                title: userData.following.postNumberFormat(),
                subtitle: "Following",
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Text(userData.username,
            style: GoogleFonts.roboto(
              color: themeRepository.theme.primaryTextColor,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 5,),
          Text(userData.profession,
            style: GoogleFonts.roboto(
              color: themeRepository.theme.secundaryTextColor,
            ),
          ),
          const SizedBox(height: 5,),
          Text(userData.description,
            style: GoogleFonts.roboto(
              color: themeRepository.theme.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}