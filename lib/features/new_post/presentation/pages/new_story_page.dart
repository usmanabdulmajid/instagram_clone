import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/camera_side_menu_tile.dart';

class NewStoryPage extends StatefulWidget {
  const NewStoryPage({
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
  _NewStoryPageState createState() => _NewStoryPageState();
}

class _NewStoryPageState extends State<NewStoryPage>
    with TickerProviderStateMixin {
  AnimationController rotationController;
  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: widget.selectedIndex == 1 ? 1 : 0,
        child: Container(
          alignment: Alignment.center,
          width: _size.width / 2,
          height: _size.height,
          padding: EdgeInsets.only(bottom: klargeIconSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: Text(
                  'Aa',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Create'),
                ),
              ),
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: Icon(Icons.all_inclusive_outlined),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Boomerang'),
                ),
              ),
              CameraSideMenuTile(
                leftSide: widget.leftPosition,
                leading: Icon(Icons.dashboard),
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.collapseTile ? 1 : 0,
                  child: Text('Layout'),
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
                        leading: Icon(Icons.set_meal),
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: widget.collapseTile ? 1 : 0,
                          child: Text('Multi-Capture'),
                        ),
                      ),
                      CameraSideMenuTile(
                        leftSide: widget.leftPosition,
                        leading: Icon(Icons.set_meal),
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: widget.collapseTile ? 1 : 0,
                          child: Text('Photobooth'),
                        ),
                      ),
                      CameraSideMenuTile(
                        leftSide: widget.leftPosition,
                        leading: Icon(Icons.stop_circle_outlined),
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: widget.collapseTile ? 1 : 0,
                          child: Text('Hands-Free'),
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
