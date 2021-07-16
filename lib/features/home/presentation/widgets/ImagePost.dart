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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                  color: Color(0xFF000000),
                  icon: Icon(Icons.more_vert),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => {
              setState(() {
                _imagePageCountVisible = !_imagePageCountVisible;
                Future.delayed(Duration(seconds: 5), () {
                  setState(() {
                    _imagePageCountVisible = false;
                  });
                });
              })
            },
            child: Stack(
              children: [
                Image.asset("assets/images/selfie_test.jpg"),
                Positioned(
                  top: kmediumSpace,
                  right: kmediumSpace,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: _imagePageCountVisible ? 1 : 0,
                    child: Container(
                      padding: EdgeInsets.all(ksmallSpace),
                      decoration: BoxDecoration(
                        color: Color(0xFF121212).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(kmediumSpace),
                      ),
                      child: Text(
                        "1/2",
                        style: TextStyle(color: Color(0xFFF9F9F9)),
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
                      Icons.favorite_outline,
                      size: klargeIconSize,
                    ),
                    SizedBox(
                      width: ksmallSpace,
                    ),
                    Icon(
                      Icons.topic_rounded,
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
                      Icons.turned_in_not_rounded,
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
