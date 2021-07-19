
import 'package:flutter/material.dart';

class XMargin extends StatelessWidget {
  final double x;
  const XMargin(this.x);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class YMargin extends StatelessWidget {
  final double y;
  const YMargin(this.y);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

//A custom class for handling text size, margin size and other responsiveness related issues
class Sizing {
  // static keyword included so you can call this method without instantiating an object of it like so :
  // Config.yMargin(context, 2)
  static double yMargin(BuildContext context, double height) {
    double screenHeight = MediaQuery.of(context).size.height / 100;
    return height * screenHeight;
  }

  static double xMargin(BuildContext context, double width) {
    double screenWidth = MediaQuery.of(context).size.width / 100;
    return width * screenWidth;
  }

  static double textSize(BuildContext context, double textSize) {
    double screenWidth = MediaQuery.of(context).size.width / 100;
    return textSize * screenWidth;
  }
}

