import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

optionsBottomSheet(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;
  bool darkModeOn = brightness == Brightness.dark;
  var _size = MediaQuery.of(context).size;
  showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor:
          darkModeOn ? Theme.of(context).accentColor : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20.0,
          ),
          topRight: Radius.circular(
            20.0,
          ),
        ),
      ),
      enableDrag: true,
      context: context,
      builder: (context) {
        return Container(
          height: _size.height * 0.25,
          padding: EdgeInsets.only(top: 10),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 35,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).unselectedWidgetColor),
                ),
              ),
              YMargin(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'More options',
                      style: TextStyle(
                        color: darkModeOn ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  YMargin(2),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.transparent,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Create highlight',
                        style: TextStyle(
                          color: darkModeOn ? Colors.white : Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  YMargin(5),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.transparent,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          color: darkModeOn ? Colors.white : Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      });
}
