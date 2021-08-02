import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class CaptureBottomTile extends StatelessWidget {
  final Function onTap;
  final Widget leading;
  final String title;
  final bool removeBorder;

  const CaptureBottomTile(
      {this.leading, this.title, this.onTap, this.removeBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: Colors.white12,
      ),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: removeBorder
                  ? null
                  : Border.all(
                      color: Colors.white,
                    ),
            ),
            child: ClipOval(child: leading),
          ),
          XMargin(5.0),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}
