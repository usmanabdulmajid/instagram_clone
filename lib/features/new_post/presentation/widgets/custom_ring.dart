import 'package:flutter/material.dart';

class CustomRing extends CustomClipper<Path> {
  double x;
  double y;
  double w;
  CustomRing({this.x, this.y, this.w});

  @override
  Path getClip(Size size) {
    var path = Path();
    var rect = Rect.fromLTRB(0, 0, x, y);
    path.addOval(rect);
    path.fillType = PathFillType.evenOdd;
    var rect2 = Rect.fromLTRB(0 + w, 0 + w, x - w, y - w);
    path.addOval(rect2);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
