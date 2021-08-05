import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/capture_button.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/captured_media_page.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/custom_ring.dart';

List<CameraDescription> cameras;

class NewStoryPage extends StatefulWidget {
  @override
  _NewStoryPageState createState() => _NewStoryPageState();
}

class _NewStoryPageState extends State<NewStoryPage>
    with TickerProviderStateMixin {
  CameraController _cameraController;
  Future<void> _initailizeCameraFuture;

  AnimationController rotationController;
  Animation<double> _animation;

  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );
    _initailizeCameraFuture = _cameraController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  bool collapseTile = false;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            height: _size.height,
            width: _size.width,
            child: FutureBuilder(
              future: _initailizeCameraFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _size.width / 2,
            padding: EdgeInsets.only(left: ksmallSpace),
            // color: Colors.blueAccent,
            decoration: BoxDecoration(
              boxShadow: collapseTile
                  ? [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: _size.width,
                        offset: Offset(-_size.width / 4, 0),
                        spreadRadius: 0,
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: _size.width,
                        offset: Offset(-_size.width / 4, 0),
                        spreadRadius: 0,
                      )
                    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tile(
                  leadingWidget: Icon(Icons.set_meal),
                  title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Create')),
                ),
                Tile(
                  leadingWidget: Icon(Icons.all_inclusive_outlined),
                  title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Boomerang')),
                ),
                Tile(
                  leadingWidget: Icon(Icons.set_meal),
                  title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Layout')),
                ),
                AnimatedSize(
                  vsync: this,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: Container(
                    height: collapseTile ? null : 0,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Tile(
                              leadingWidget: Icon(Icons.set_meal),
                              title: AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  opacity: collapseTile ? 1 : 0,
                                  child: Text('Multi-Capture')),
                            ),
                            Tile(
                              leadingWidget: Icon(Icons.set_meal),
                              title: AnimatedOpacity(
                                  duration: Duration(milliseconds: 300),
                                  opacity: collapseTile ? 1 : 0,
                                  child: Text('Photobooth')),
                            ),
                            Tile(
                              leadingWidget: Icon(Icons.set_meal),
                              title: AnimatedOpacity(
                                  duration: Duration(milliseconds: 300),
                                  opacity: collapseTile ? 1 : 0,
                                  child: Text('Hands-Free')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Tile(
                  leadingWidget: GestureDetector(
                    onTap: () {
                      setState(() {
                        collapseTile = !collapseTile;
                        if (collapseTile) {
                          rotationController.forward();
                        } else {
                          rotationController.reverse();
                        }
                      });
                    },
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.5)
                          .animate(rotationController),
                      child: Icon(Icons.expand_more),
                    ),
                  ),
                  title: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: collapseTile ? 1 : 0,
                    child: Text('Close'),
                  ),
                  onTap: () {
                    if (collapseTile) {
                      setState(() {
                        collapseTile = !collapseTile;
                        if (collapseTile) {
                          rotationController.forward();
                        } else {
                          rotationController.reverse();
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 30.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.flash_off,
                    size: 30.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              //color: Colors.transparent,
              width: _size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onLongPress: () async {
                      try {
                        await _initailizeCameraFuture;
                        await _cameraController.startVideoRecording();
                      } catch (e) {
                        print(e);
                      }
                    },
                    onLongPressUp: () {
                      onStopVideoRecord();
                    },
                    onTap: () {
                      capturePhoto();
                    },
                    child: CaptureButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void capturePhoto() async {
    try {
      await _initailizeCameraFuture;

      final image = await _cameraController.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CapturedMediaPage(
              path: image.path,
              image: true,
            );
          },
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  void onStopVideoRecord() async {
    try {
      final video = await _cameraController.stopVideoRecording();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CapturedMediaPage(
              path: video.path,
              image: false,
            );
          },
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
