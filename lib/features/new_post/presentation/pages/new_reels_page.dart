import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/camera_side_menu_tile.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/capture_button.dart';

import 'new_story_page.dart';

class NewReelsPage extends StatefulWidget {
  @override
  _NewReelsPageState createState() => _NewReelsPageState();
}

class _NewReelsPageState extends State<NewReelsPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  CameraController _cameraController;
  Future<void> _initailizeCameraFuture;
  AnimationController rotationController;

  List<CameraDescription> cameras;

  int _selected = 0;

  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    setupCamera();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    final CameraController controller = _cameraController;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      setupCamera(cameraDescription: controller.description);
    }
  }

  Future<void> setupCamera({CameraDescription cameraDescription}) async {
    cameras = await availableCameras();
    if (_cameraController != null) {
      await _cameraController.dispose();
    }
    var cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
    );
    _cameraController = cameraController;
    _initailizeCameraFuture = _cameraController.initialize();

    var controller = await selectCamera();
    setState(() {
      _cameraController = controller;
      _initailizeCameraFuture = _cameraController.initialize();
    });
  }

  selectCamera() async {
    var controller =
        CameraController(cameras[_selected], ResolutionPreset.high);
    await controller.initialize();
    return controller;
  }

  @override
  void dispose() {
    //_cameraController.dispose();
    rotationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
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
                  print('wow ${snapshot.connectionState}');
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          //side camera menu
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
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
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: Icon(Icons.audiotrack),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Audio'),
                    ),
                  ),
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: Icon(Icons.all_inclusive_outlined),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Length'),
                    ),
                  ),
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: Text(
                      '1X',
                      style: TextStyle(
                        //fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Speed'),
                    ),
                  ),
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: Icon(Icons.auto_awesome),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Effects'),
                    ),
                  ),
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: Icon(Icons.stop_circle_outlined),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Touch up'),
                    ),
                  ),
                  CameraSideMenuTile(
                    leftSide: leftPosition,
                    leading: Icon(Icons.dashboard),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 1 : 0,
                      child: Text('Video layout'),
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
                            leading: Icon(Icons.timer),
                            title: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: collapseTile ? 1 : 0,
                              child: Text('Timer'),
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
                  child: Icon(Icons.airplanemode_active),
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
                    onTap: () {
                      //recordVideo();
                    },
                    child: CaptureButton(
                      child: Icon(
                        Icons.movie_creation_rounded,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void recordVideo() async {
    try {
      await _initailizeCameraFuture;
      await _cameraController.startVideoRecording();
      //final video = await _cameraController.stopVideoRecording();
    } catch (e) {
      print(e);
    }
  }
}
