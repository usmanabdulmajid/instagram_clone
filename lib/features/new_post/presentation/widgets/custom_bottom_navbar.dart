import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final ValueChanged onChanged;
  final int selectedIndex;

  const CustomBottomNavBar({this.onChanged, this.selectedIndex});
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.black,
      height: 80.0,
      width: _size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              widget.onChanged(0);
            },
            child: Text(
              'POST',
              style: TextStyle(
                  color:
                      widget.selectedIndex == 0 ? Colors.white : Colors.grey),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              widget.onChanged(1);
            },
            child: Text(
              'STORY',
              style: TextStyle(
                  color:
                      widget.selectedIndex == 1 ? Colors.white : Colors.grey),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              widget.onChanged(2);
            },
            child: Text(
              'REELS',
              style: TextStyle(
                  color:
                      widget.selectedIndex == 2 ? Colors.white : Colors.grey),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              widget.onChanged(3);
            },
            child: Text(
              'LIVE',
              style: TextStyle(
                  color:
                      widget.selectedIndex == 3 ? Colors.white : Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
