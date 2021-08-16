import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'dart:math' as Math;

import 'custom_ring.dart';

class CaptureButton extends StatefulWidget {
  const CaptureButton({
    this.selectedIndex,
    this.child,
    this.cameraCaptureTap,
    this.cameraCaptureLongPress,
    this.cameraCaptureLongPressUp,
  });
  final int selectedIndex;
  final Widget child;
  final VoidCallback cameraCaptureTap;
  final VoidCallback cameraCaptureLongPress;
  final VoidCallback cameraCaptureLongPressUp;

  @override
  _CaptureButtonState createState() => _CaptureButtonState();
}

class _CaptureButtonState extends State<CaptureButton> {
  ScrollController buttonScrollController;

  @override
  void initState() {
    buttonScrollController = ScrollController(initialScrollOffset: 57);
    buttonScrollController.addListener(() {
      // buttonScrollController.jumpTo(0.0);
    });
    super.initState();
  }

  void buttonScrollChange() {}

  //Distance between two points
  double distance(double a, double b) =>
      Math.sqrt((a - b) * (a - b) + (a - b) * (a - b));

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: _size.width / 7 + 16,
            width: _size.width,
            child: ListView.builder(
              controller: buttonScrollController,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: ClipOval(
                    child: Container(
                      height: _size.width / 7,
                      width: _size.width / 7,
                      color: index > 2
                          ? index == 3
                              ? Colors.white
                              : Colors.blue[index * 100]
                          : Colors.transparent,
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          ClipPath(
            clipper: CustomRing(w: 5.0, x: 80, y: 80),
            child: GestureDetector(
              onTap: widget.cameraCaptureTap,
              onLongPress: widget.cameraCaptureLongPress,
              onLongPressUp: widget.cameraCaptureLongPressUp,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
