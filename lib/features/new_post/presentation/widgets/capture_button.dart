import 'package:flutter/material.dart';

import 'custom_ring.dart';

class CaptureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipPath(
            clipper: CustomRing(w: 5.0, x: 80, y: 80),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 65.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
