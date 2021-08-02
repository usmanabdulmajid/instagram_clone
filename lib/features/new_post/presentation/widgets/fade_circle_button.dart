import 'package:flutter/material.dart';

class FadeCircleButton extends StatelessWidget {
  final Widget child;
  final Function onTap;

  const FadeCircleButton({Key key, this.onTap, this.child});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        //padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: child,
      ),
    );
  }
}
