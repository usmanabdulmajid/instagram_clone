import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/camera_side_menu_tile.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/capture_button.dart';

import 'new_story_page.dart';

class NewReelsPage extends StatefulWidget {
  const NewReelsPage({
    Key key,
    @required this.selectedIndex,
    @required this.collapseTile,
    @required this.leftPosition,
    @required this.onExpand,
    @required this.onIfExpand,
  }) : super();

  final int selectedIndex;
  final bool collapseTile;
  final bool leftPosition;
  final VoidCallback onExpand;
  final VoidCallback onIfExpand;
  @override
  _NewReelsPageState createState() => _NewReelsPageState();
}

class _NewReelsPageState extends State<NewReelsPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController rotationController;
  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: widget.selectedIndex == 2 ? 1 : 0,
        child: Container(
          alignment: Alignment.center,
          height: _size.height,
          padding: EdgeInsets.only(bottom: klargeIconSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: Icon(Icons.audiotrack),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Audio'),
                ),
              ),
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: Icon(Icons.all_inclusive_outlined),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Length'),
                ),
              ),
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: Text(
                  '1X',
                  style: TextStyle(
                    //fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Speed'),
                ),
              ),
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: Icon(Icons.auto_awesome),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Effects'),
                ),
              ),
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: Icon(Icons.stop_circle_outlined),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Touch up'),
                ),
              ),
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: Icon(Icons.dashboard),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Video layout'),
                ),
              ),
              AnimatedSize(
                vsync: this,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: Container(
                  height: widget.collapseTile ? null : 0,
                  child: Column(
                    children: [
                      CameraSideMenuTile(
                        leftSide: widget.leftPosition,
                        leading: Icon(Icons.timer),
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: widget.collapseTile ? 1 : 0,
                          child: Text('Timer'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: GestureDetector(
                  onTap: widget.onIfExpand,
                  child: RotationTransition(
                    turns:
                        Tween(begin: 0.0, end: 0.5).animate(rotationController),
                    child: Icon(Icons.expand_more),
                  ),
                ),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Close'),
                ),
                onTap: widget.onExpand,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
