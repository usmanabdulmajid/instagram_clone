import 'package:flutter/material.dart';

class LoginProceedButton extends StatelessWidget {
  final Widget child;
  final bool disableButton;
  final Function onTap;

  const LoginProceedButton({this.disableButton, this.onTap, this.child});
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: _size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: disableButton ? Colors.blue.shade50 : Colors.blue,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: child,
      ),
    );
  }
}
