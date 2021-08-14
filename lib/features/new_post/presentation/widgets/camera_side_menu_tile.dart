import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class CameraSideMenuTile extends StatelessWidget {
  final bool leftSide;
  final Widget leading;
  final Widget title;
  final Function onTap;

  const CameraSideMenuTile(
      {this.leftSide = true, this.leading, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        child: leftSide
            ? Row(
                children: [leading, XMargin(20), title],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [title, XMargin(20), leading],
              ),
      ),
    );
  }
}
