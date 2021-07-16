import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class ImagePost extends StatefulWidget {
  const ImagePost({Key key}) : super(key: key);

  @override
  _ImagePostState createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  bool _imagePageCountVisible = false;
  bool _cateloge = true;
  String _imagePageCount = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(ksmallSpace),
                  child: Icon(
                    Icons.account_circle,
                    size: ksmallAvatarRadius,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "joshua_l",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('data'),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => {
              setState(() {
                if (_cateloge) {
                  _imagePageCountVisible = !_imagePageCountVisible;
                  Future.delayed(Duration(seconds: 5), () {
                    setState(() {
                      _imagePageCountVisible = false;
                    });
                  });
                }
              })
            },
            child: Stack(
              children: [
                Image.asset("assets/images/selfie_test.jpg"),
                Positioned(
                  top: kmediumSpace,
                  right: kmediumSpace,
                  child: Visibility(
                    visible: _cateloge,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: _imagePageCountVisible ? 1 : 0,
                      child: Container(
                        width: 40,
                        padding: EdgeInsets.all(ksmallSpace),
                        decoration: BoxDecoration(
                          color: Color(0xFF121212).withOpacity(0.7),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(kmediumSpace),
                              right: Radius.circular(kmediumSpace)),
                        ),
                        child: Center(
                          child: Text(
                            "1/2",
                            style: TextStyle(
                                color: Color(0xFFF9F9F9), fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(ksmallSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite_outline_sharp,
                      size: klargeIconSize,
                    ),
                    SizedBox(
                      width: ksmallSpace,
                    ),
                    Icon(
                      Icons.message_outlined,
                      size: klargeIconSize,
                    ),
                    SizedBox(
                      width: ksmallSpace,
                    ),
                    Icon(
                      Icons.send_outlined,
                      size: klargeIconSize,
                    ),
                    SizedBox(
                      width: ksmallSpace,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Icon(
                      Icons.bookmark_border_outlined,
                      size: klargeIconSize,
                    ),
                  ],
                ),
                SizedBox(
                  height: ksmallSpace,
                ),
                Text(
                  "38,990 Views",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: ksmallSpace / 2,
                ),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: "joshua_l ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "The game in Japan was amazing and I want to share some photosThe game in Japan was amazing and I want to share some photosThe game in Japan was amazing and I want to share some photosThe game in Japan was amazing and I want to share some photosThe game in Japan was amazing and I want to share some photos",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
