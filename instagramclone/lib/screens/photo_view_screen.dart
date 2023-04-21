import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScreen extends StatelessWidget {
  final String photo;
  final bool isNetwork;
  const PhotoViewScreen({required this.photo, this.isNetwork = false, super.key});

  @override
  Widget build(BuildContext context) {
    return isNetwork ?
      Image.network(photo)
    : PhotoView(
      imageProvider: FileImage(File(photo)),
    );
  }
}