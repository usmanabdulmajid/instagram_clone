import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/archive/presentation/pages/live_archive_page.dart';
import 'package:instagram_clone/features/archive/presentation/pages/posts_archive_page.dart';
import 'package:instagram_clone/features/archive/presentation/pages/stories_archive.dart';

archiveBottomSheet(BuildContext context) {
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
          padding: EdgeInsets.only(left: 8, top: 10, bottom: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => StoriesArchive(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Text(
                      'Stories archive',
                      style: TextStyle(
                        color: darkModeOn ? Colors.white : Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  YMargin(5),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => PostsArchivePage(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Text(
                      'Posts archive',
                      style: TextStyle(
                        color: darkModeOn ? Colors.white : Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  YMargin(5),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => LiveArchivePage(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Text(
                      'Live archive',
                      style: TextStyle(
                        color: darkModeOn ? Colors.white : Colors.black,
                        fontSize: 16.0,
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
