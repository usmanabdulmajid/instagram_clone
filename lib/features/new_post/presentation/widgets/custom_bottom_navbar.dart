import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class CustomBottomNavBar extends StatefulWidget {
  final ValueChanged onChanged;
  final int selectedIndex;
  final ScrollController controller;
  final Widget leftSideWidget;
  final Widget rightSideWidget;

  const CustomBottomNavBar(
      {this.onChanged,
      this.selectedIndex,
      this.controller,
      this.leftSideWidget,
      this.rightSideWidget});
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: _size.width, maxHeight: Sizing.yMargin(context, 11)),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            color: Colors.black.withOpacity(widget.selectedIndex == 0 ? 0 : 1),
            child: ListView(
              controller: widget.controller,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: _size.width / 2.6,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: ksmallSpace,
                      left: ksmallSpace,
                      bottom: kmediumSpace * 1.5),
                  child: Container(
                    padding: EdgeInsets.only(left: kmediumSpace),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            widget.onChanged(0);
                          },
                          child: Text(
                            'POST',
                            style: TextStyle(
                                color: widget.selectedIndex == 0
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            widget.onChanged(1);
                          },
                          child: Text(
                            'STORY',
                            style: TextStyle(
                              color: widget.selectedIndex == 1
                                  ? Colors.white
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            widget.onChanged(2);
                          },
                          child: Text(
                            'REELS',
                            style: TextStyle(
                              color: widget.selectedIndex == 2
                                  ? Colors.white
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            widget.onChanged(3);
                          },
                          child: Text(
                            'LIVE',
                            style: TextStyle(
                              color: widget.selectedIndex == 3
                                  ? Colors.white
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: ksmallSpace, bottom: kmediumSpace * 1.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                    ),
                    width: _size.width / 4,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: ksmallSpace,
          left: ksmallSpace,
          child: Visibility(
            visible: widget.selectedIndex != 0,
            child: Padding(
              padding: const EdgeInsets.all(ksmallSpace),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.white,
                    width: ksmallSpace / 4,
                  ),
                  borderRadius: BorderRadius.circular(ksmallSpace),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(25, 0),
                      blurRadius: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: ksmallSpace,
          right: ksmallSpace,
          child: Visibility(
            visible: widget.selectedIndex != 0,
            child: Padding(
              padding: const EdgeInsets.all(ksmallSpace),
              child: Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ksmallSpace),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(-25, 0),
                        blurRadius: 30,
                      )
                    ],
                  ),
                  child: widget.rightSideWidget),
            ),
          ),
        ),
      ],
    );
  }
}
