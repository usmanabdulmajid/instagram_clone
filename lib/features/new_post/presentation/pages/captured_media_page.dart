import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/capture_bottom_tile.dart';
import 'package:video_player/video_player.dart';
import '../widgets/fade_circle_button.dart';

class CapturedMediaPage extends StatefulWidget {
  final bool image;
  final String path;

  const CapturedMediaPage({Key key, this.path, this.image});

  @override
  _CapturedMediaPageState createState() => _CapturedMediaPageState();
}

class _CapturedMediaPageState extends State<CapturedMediaPage> {
  VideoPlayerController _videoController;
  Future<void> _initializeVideoplayerFuture;
  @override
  void initState() {
    _videoController = VideoPlayerController.file(File(widget.path));
    _initializeVideoplayerFuture = _videoController.initialize()
      ..then((_) {
        setState(() {
          _videoController.play();
        });
      });
    super.initState();
    _videoController.setLooping(true);
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: _size.width,
        height: _size.height,
        child: Stack(
          children: [
            Container(
              height: _size.height,
              child: widget.image
                  ? Image.file(
                      File(widget.path),
                      fit: BoxFit.cover,
                    )
                  : FutureBuilder(
                      future: _initializeVideoplayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return VideoPlayer(_videoController);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
            ),
            Positioned(
              top: 0.0,
              child: Container(
                padding: EdgeInsets.only(top: 50, left: 10.0, right: 10.0),
                width: _size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeCircleButton(
                      child: Icon(
                        Icons.chevron_left,
                        size: 30.0,
                      ),
                    ),
                    Row(
                      children: [
                        FadeCircleButton(
                          child: Text(
                            'Aa',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        XMargin(5),
                        FadeCircleButton(
                          child: Icon(
                            Icons.photo_rounded,
                            size: 30.0,
                          ),
                        ),
                        XMargin(5),
                        FadeCircleButton(
                          child: Icon(
                            Icons.music_note_outlined,
                            size: 30.0,
                          ),
                        ),
                        XMargin(5),
                        FadeCircleButton(
                          child: Icon(
                            Icons.more_horiz,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                      removeBorder: false,
                      onTap: () {},
                      leading: Image.asset(
                        'assets/images/selfie_test.jpg',
                        fit: BoxFit.cover,
                      ),
                      title: 'Your Story',
                    ),
                    XMargin(10),
                    CaptureBottomTile(
                      removeBorder: true,
                      onTap: () {},
                      leading: Container(
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.star,
                          size: 16,
                        ),
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
