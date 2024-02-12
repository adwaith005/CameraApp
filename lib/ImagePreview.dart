import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final File clickedimage;
  ImagePreview({Key? key, required this.clickedimage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(
          clickedimage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
