import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';

class RadioCkeck extends StatefulWidget {
  const RadioCkeck({Key key}) : super(key: key);

  @override
  _RadioCkeckState createState() => _RadioCkeckState();
}

class _RadioCkeckState extends State<RadioCkeck> {
  bool _isChecked;

  void _setChecked(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isChecked) {
          _setChecked(false);
        } else {
          _setChecked(true);
        }
      },
      child: SizedBox(
        width: kmediumSpace * 3,
        height: kmediumSpace * 3,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: kmediumSpace,
              width: kmediumSpace * 2,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(100)),
            ),
            AnimatedPositioned(
                left: _isChecked ? kmediumSpace * 2 : -kmediumSpace,
                child: ClipOval(
                  child: Container(
                    height: kmediumSpace * 2,
                    width: kmediumSpace * 2,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                duration: Duration(milliseconds: 300))
          ],
        ),
      ),
    );
  }
}
