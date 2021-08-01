import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/capture_bottom_tile.dart';

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
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 15.0,
                ),
                width: _size.width,
                height: 80,
                color: AppColors.black,
                child: Row(
                  children: [
                    CaptureBottomTile(
                      onTap: () {},
                      leading: Image.asset(
                        'assets/images/selfie_test.jpg',
                        fit: BoxFit.cover,
                      ),
                      title: 'Your Story',
                    ),
                    XMargin(10),
                    CaptureBottomTile(
                      onTap: () {},
                      leading: Image.asset(
                        'assets/images/selfie_test.jpg',
                        fit: BoxFit.cover,
                      ),
                      title: 'Close Friends',
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
