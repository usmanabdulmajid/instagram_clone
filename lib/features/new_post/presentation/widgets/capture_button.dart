import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
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
  double selectedButton = 1.0;

  @override
  void initState() {
    buttonScrollController = ScrollController();
    buttonScrollController.position.isScrollingNotifier
        .addListener(buttonScrollChange);
    super.initState();
  }

  void buttonScrollChange() {
    var d = (buttonScrollController.position.maxScrollExtent / 10) - 155.25;
    var f = d + buttonScrollController.offset;
    setState(() {
      if (f - d < 34 && selectedButton != 1.0) {
        buttonScrollController.jumpTo(d);
        selectedButton = 1;
      } else if (f - d >= 34.25 && selectedButton != 2.0) {
        buttonScrollController.jumpTo(d + 68.5 * 2 + 34.25 + 9);
        selectedButton = 2;
      }
    });
  }

  //Distance between two points
  double distance(int a, double b) => (a - b).abs() == 0 ? 0 : 4;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: _size.width / 6,
            width: _size.width,
            child: ListView.separated(
              shrinkWrap: true,
              cacheExtent: 0,
              controller: buttonScrollController,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              separatorBuilder: (ctx, index) => SizedBox(
                width: kmediumSpace,
              ),
              itemBuilder: (ctx, index) {
                return index == 0
                    ? SizedBox(
                        width: 5 * (_size.width / 12) - kmediumSpace,
                      )
                    : ClipOval(
                        child: AnimatedPadding(
                          duration: Duration(milliseconds: 300),
                          padding:
                              EdgeInsets.all(distance(index, selectedButton)),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: _size.width / 6 -
                                distance(index, selectedButton),
                            width: _size.width / 6 -
                                distance(index, selectedButton),
                            decoration: BoxDecoration(
                              color: index == 3 ? Colors.white : Colors.blue,
                              borderRadius:
                                  BorderRadius.circular(_size.width / 6),
                            ),
                          ),
                        ),
                      );
              },
              itemCount: 11,
            ),
          ),
          ClipPath(
            clipper: CustomRing(w: 5.0, x: 85, y: 85),
            child: GestureDetector(
              onTap: widget.cameraCaptureTap,
              onLongPress: widget.cameraCaptureLongPress,
              onLongPressUp: widget.cameraCaptureLongPressUp,
              child: Container(
                height: 85,
                width: 85,
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
