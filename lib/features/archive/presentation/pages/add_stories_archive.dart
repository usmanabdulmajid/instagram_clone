import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class AddStoriesArchive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Container(
      width: _size.width,
      height: _size.height,
      padding:
          EdgeInsets.only(top: _size.height * 0.2, left: 16.0, right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Add to your story',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: darkModeOn ? Colors.white : Colors.black,
            ),
          ),
          YMargin(10),
          Container(
            width: _size.width * 0.65,
            child: Text(
              'Keep your stories in your archive after they\'ve disappeared, so that you can look back on your memories. Only you can see what\'s in your archive.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ),
          YMargin(10),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.transparent),
            ),
            onPressed: () {},
            child: Text(
              'Change archive controls in settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
