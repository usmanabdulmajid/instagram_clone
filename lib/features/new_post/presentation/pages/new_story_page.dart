import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/camera_side_menu_tile.dart';
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
  bool leftPosition = true;
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
          //side camera menu
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            right: leftPosition ? _size.width * 0.5 : 0.0,
            top: 0.0,
            curve: Curves.decelerate,
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: Duration(milliseconds: 300),
              width: _size.width / 2,
              height: _size.height,
              padding: EdgeInsets.only(bottom: klargeIconSize),
              decoration: BoxDecoration(
                boxShadow: collapseTile
                    ? [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: _size.width,
                          offset: Offset(
                              (leftPosition ? -_size.width : _size.width) / 4,
                              0),
                          spreadRadius: 0,
                        )
                      ]
                    : [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: Offset(
                              (leftPosition ? -_size.width : _size.width) / 4,
                              0),
                          spreadRadius: 0,
                        )
                      ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: Text(
                      'Aa',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Create'),
                    ),
                  ),
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: Icon(Icons.all_inclusive_outlined),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Boomerang'),
                    ),
                  ),
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: Icon(Icons.dashboard),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Layout'),
                    ),
                  ),
                  AnimatedSize(
                    vsync: this,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    child: Container(
                      height: collapseTile ? null : 0,
                      child: Column(
                        children: [
                          CameraSideMenuTile(
                            leftSide: leftPosition,
                            leading: Icon(Icons.set_meal),
                            title: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: collapseTile ? 1 : 0,
                              child: Text('Multi-Capture'),
                            ),
                          ),
                          CameraSideMenuTile(
                            leftSide: leftPosition,
                            leading: Icon(Icons.set_meal),
                            title: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: collapseTile ? 1 : 0,
                              child: Text('Photobooth'),
                            ),
                          ),
                          CameraSideMenuTile(
                            leftSide: leftPosition,
                            leading: Icon(Icons.stop_circle_outlined),
                            title: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: collapseTile ? 1 : 0,
                              child: Text('Hands-Free'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: GestureDetector(
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
          ),

          //top camera button bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.settings,
                    size: 30.0,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.flash_off,
                    size: 30.0,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.close,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          //switch camera menu button
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            right: leftPosition ? _size.width - 36 : 12.0,
            top: 34.0,
            child: Container(
              child: Visibility(
                visible: collapseTile,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      leftPosition = !leftPosition;
                    });
                  },
                  child: Icon(Icons.sync_alt_outlined),
                ),
              ),
            ),
          ),
          //camera buttom bar
          Positioned(
            bottom: 0.0,
            child: Container(
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
