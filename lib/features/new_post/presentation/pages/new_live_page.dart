import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/camera_side_menu_tile.dart';

class NewLivePage extends StatelessWidget {
  const NewLivePage({
    Key key,
    @required this.selectedIndex,
    @required this.leftPosition,
  }) : super();
  final int selectedIndex;
  final bool leftPosition;
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
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
    );
  }
}
