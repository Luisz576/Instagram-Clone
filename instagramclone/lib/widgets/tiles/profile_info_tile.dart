import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/repositories/theme_repository.dart';
import 'package:provider/provider.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title, subtitle;
  const ProfileInfoTile({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    ThemeRepository themeRepository = context.watch<ThemeRepository>();
    return Column(
      children: [
        Text(title,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: themeRepository.theme.primaryTextColor
          ),
        ),
        Text(subtitle,
          style: GoogleFonts.roboto(
            fontSize: 12,
            color: themeRepository.theme.primaryTextColor
          ),
        )
      ],
    );
  }
}