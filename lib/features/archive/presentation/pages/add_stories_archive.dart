import 'package:flutter/material.dart';

class AddStoriesArchive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      child: Center(
        child: Text('Add Stories'),
      ),
    );
  }
}
