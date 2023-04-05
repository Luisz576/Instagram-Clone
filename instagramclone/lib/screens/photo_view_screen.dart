import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScreen extends StatelessWidget {
  final String photo;
  const PhotoViewScreen({required this.photo, super.key});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: FileImage(File(photo)),
    );
  }
}