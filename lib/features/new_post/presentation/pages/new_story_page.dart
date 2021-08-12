import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/camera_side_menu_tile.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/capture_button.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/captured_media_page.dart';

class NewStoryPage extends StatefulWidget {
  @override
  _NewStoryPageState createState() => _NewStoryPageState();
}

class _NewStoryPageState extends State<NewStoryPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController rotationController;

  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    super.initState();
  }

  bool collapseTile = false;
  bool leftPosition = true;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        //side camera menu
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          right: leftPosition ? _size.width * 0.5 : 0.0,
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
                            (leftPosition ? -_size.width : _size.width) / 4, 0),
                        spreadRadius: 0,
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.transparent,
                        offset: Offset(
                            (leftPosition ? -_size.width : _size.width) / 4, 0),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
      ],
    );
  }
}
