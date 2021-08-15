import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationStoriesArchive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      child: Center(
        child: Text('Location'),
      ),
    );
  }
}
