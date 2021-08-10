import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class PostsArchivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back),
        ),
        title: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                "Posts archive",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Transform.rotate(
                angle: 1.5708,
                child: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.more_vert),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        width: _size.width,
        height: _size.height,
        padding:
            EdgeInsets.only(top: _size.height * 0.2, left: 16.0, right: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No archived posts',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: darkModeOn ? Colors.white : Colors.black,
              ),
            ),
            YMargin(10),
            Container(
              width: _size.width * 0.7,
              child: Text(
                'When you archive posts, they\'ll appear here. Only you will be able to see them. Archive posts by tapping on the ⋮ button.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
