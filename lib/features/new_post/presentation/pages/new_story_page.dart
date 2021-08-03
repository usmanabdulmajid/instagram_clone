import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/capture_button.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/captured_media_page.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/custom_ring.dart';

List<CameraDescription> cameras;

class NewStoryPage extends StatefulWidget {
  @override
  _NewStoryPageState createState() => _NewStoryPageState();
}

class _NewStoryPageState extends State<NewStoryPage> {
  CameraController _cameraController;
  Future<void> _initailizeCameraFuture;
  @override
  void initState() {
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
          // AnimatedSwitcher(
          //   duration: Duration(milliseconds: 500),
          //   child: Container(
          //     padding: EdgeInsets.only(top: 70.0),
          //     child: Column(
          //       children: [
          //         ListTile(
          //           leading: IconButton(
          //             icon: Icon(Icons.set_meal),
          //             onPressed: () {},
          //           ),
          //           title: Text('Create'),
          //         ),
          //         ListTile(
          //           leading: IconButton(
          //             icon: Icon(Icons.set_meal),
          //             onPressed: () {},
          //           ),
          //           title: Text('Create'),
          //         ),
          //         collapseTile
          //             ? SizedBox()
          //             : ListTile(
          //                 leading: IconButton(
          //                   icon: Icon(Icons.set_meal),
          //                   onPressed: () {},
          //                 ),
          //                 title: Text('Create'),
          //               ),
          //         collapseTile
          //             ? SizedBox()
          //             : ListTile(
          //                 leading: IconButton(
          //                   icon: Icon(Icons.set_meal),
          //                   onPressed: () {},
          //                 ),
          //                 title: Text('Create'),
          //               ),
          //         collapseTile
          //             ? SizedBox()
          //             : ListTile(
          //                 leading: IconButton(
          //                   icon: Icon(Icons.set_meal),
          //                   onPressed: () {},
          //                 ),
          //                 title: Text('Create'),
          //               ),
          //         ListTile(
          //           leading: IconButton(
          //             icon: Icon(Icons.set_meal),
          //             onPressed: () {},
          //           ),
          //           title: Text('Create'),
          //         ),
          //         ListTile(
          //           leading: IconButton(
          //             icon: Icon(Icons.arrow_drop_down_outlined),
          //             onPressed: () {
          //               setState(() {
          //                 collapseTile = !collapseTile;
          //               });
          //             },
          //           ),
          //           title: Text('Create'),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(top: 40.0),
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
