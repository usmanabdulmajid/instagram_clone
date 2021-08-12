import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/new_live_page.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/new_post_page.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/new_reels_page.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/new_story_page.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/camera_side_menu_tile.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/capture_button.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/custom_bottom_navbar.dart';

import 'captured_media_page.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  int selectedIndex = 1;
  CameraController _cameraController;
  Future<void> _initailizeCameraFuture;

  double cPos = 0.0;

  int _selected = 0;

  List<CameraDescription> cameras;
  void setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  PageController _pageController =
      PageController(initialPage: 1, keepPage: true);
  AnimationController rotationController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 1, keepPage: true);
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

  Future<CameraController> selectCamera() async {
    var controller =
        CameraController(cameras[_selected], ResolutionPreset.high);
    await controller.initialize();
    return controller;
  }

  @override
  void dispose() {
    _cameraController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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

  bool collapseTile = false;
  bool leftPosition = true;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                    print('omo ${snapshot.connectionState}');
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              children: [
                NewPostPage(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Visibility(
                      visible: selectedIndex != 3,
                      child: AnimatedPositioned(
                        duration: Duration(milliseconds: 500),
                        right: leftPosition ? _size.width * 0.5 : 0.0,
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
                                          (leftPosition
                                                  ? -_size.width
                                                  : _size.width) /
                                              4,
                                          0),
                                      spreadRadius: 0,
                                    )
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.transparent,
                                      offset: Offset(
                                          (leftPosition
                                                  ? -_size.width
                                                  : _size.width) /
                                              4,
                                          0),
                                      spreadRadius: 0,
                                    )
                                  ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      right: leftPosition
                          ? selectedIndex == 1
                              ? 0.0
                              : 20.0
                          : 0.0,
                      top: 0.0,
                      left: leftPosition
                          ? selectedIndex == 1
                              ? 0.0
                              : -20.0
                          : _size.width * 0.5,
                      curve: Curves.decelerate,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: selectedIndex == 1 ? 1 : 0,
                        child: Container(
                          alignment: Alignment.center,
                          width: _size.width / 2,
                          height: _size.height,
                          padding: EdgeInsets.only(bottom: klargeIconSize),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CameraSideMenuTile(
                                leftSide: leftPosition,
                                leading: Text(
                                  'Aa',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
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
                                        leading:
                                            Icon(Icons.stop_circle_outlined),
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
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      right: leftPosition ? _size.width * 0.5 : 0.0,
                      top: 0.0,
                      left: leftPosition
                          ? selectedIndex == 2
                              ? 0.0
                              : selectedIndex == 3
                                  ? -20
                                  : 20.0
                          : selectedIndex == 2
                              ? -_size.width * 2
                              : 0.0,
                      curve: Curves.decelerate,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: selectedIndex == 2 ? 1 : 0,
                        child: Container(
                          alignment: Alignment.center,
                          height: _size.height,
                          padding: EdgeInsets.only(bottom: klargeIconSize),
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
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      right: leftPosition ? _size.width * 0.5 : 0.0,
                      top: 0.0,
                      left: leftPosition
                          ? selectedIndex == 3
                              ? 0.0
                              : 20.0
                          : selectedIndex == 3
                              ? -_size.width * 2
                              : 0.0,
                      curve: Curves.decelerate,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: selectedIndex == 3 ? 1 : 0,
                        child: Container(
                          alignment: Alignment.center,
                          height: _size.height,
                          padding: EdgeInsets.only(bottom: klargeIconSize),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CameraSideMenuTile(
                                leftSide: leftPosition,
                                leading: Icon(Icons.list),
                                title: Text('List'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                    //top camera button bar
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: collapseTile ? 0.45 : 1,
                      child: Container(
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
                            AnimatedContainer(
                              duration: Duration(milliseconds: 600),
                              width: selectedIndex == 2
                                  ? _size.width * 0.75
                                  : _size.width * 0.175,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.flash_off,
                                      size: 30.0,
                                    ),
                                  ),
                                  Visibility(
                                    visible: selectedIndex == 2,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.airplanemode_active),
                                    ),
                                  )
                                ],
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
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      right: leftPosition ? _size.width - 36 : 12.0,
                      child: Container(
                        child: Visibility(
                          visible: collapseTile && selectedIndex != 3,
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
                  ],
                ),
              ],
              onPageChanged: (index) {
                setState(() {
                  _selected = index;
                });
              },
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: selectedIndex,
          onChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
            if (index == 0 || index == 1) {
              _pageController.jumpToPage(index);
            }
          },
        ),
      ),
    );
  }
}
