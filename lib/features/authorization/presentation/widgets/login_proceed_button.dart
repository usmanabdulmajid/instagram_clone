import 'package:flutter/material.dart';

class LoginProceedButton extends StatelessWidget {
  final Widget child;
  final bool disableButton;
  final Function onTap;

  const LoginProceedButton({this.disableButton, this.onTap, this.child});
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: _size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: darkModeOn
              ? (disableButton ? Colors.blue.shade900 : Colors.blue)
              : (!disableButton ? Colors.blue : Colors.blue[100]),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: child,
      ),
    );
  }
}
//Colors.blue.shade100 : Colors.blue,