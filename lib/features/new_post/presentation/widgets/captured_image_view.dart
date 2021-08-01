import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';

class CapturedImageView extends StatelessWidget {
  final String imagePath;

  const CapturedImageView({Key key, this.imagePath});
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: _size.width,
        height: _size.height,
        child: Stack(
          children: [
            Container(
              height: _size.height,
              child: Image.file(
                File(imagePath),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: _size.width,
                height: 80,
                color: AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
