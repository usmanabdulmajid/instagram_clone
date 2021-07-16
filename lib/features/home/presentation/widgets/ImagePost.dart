import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class ImagePost extends StatefulWidget {
  const ImagePost({Key key}) : super(key: key);

  @override
  _ImagePostState createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> with TickerProviderStateMixin {
  bool _imagePageCountVisible = false;
  bool _cateloge = false;
  bool _likedPost = false;
  bool _hasComment = false;
  int _commentCount = 3;
  int _imageCount = 4;
  int _currentImagePageNumber = 1;
  String _imagePageCount;
  Size _imageSize;

  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
    if (_commentCount > 0) {
      _hasComment = true;
    }
    if (_imageCount > 0) {
      _cateloge = true;
      _imagePageCount = "$_currentImagePageNumber/$_imageCount";
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
            onDoubleTap: () => {
              if (!_likedPost)
                {
                  setState(() {
                    _likedPost = true;
                    _controller.forward();
                  })
                }
              else
                {
                  setState(() {
                    _controller
                        .forward()
                        .whenComplete(() => _controller.reverse());
                  })
                }
            },
            child: Builder(builder: (BuildContext ctx) {
              return Stack(
                children: [
                  Image.asset("assets/images/selfie_test.jpg"),
                  Positioned(
                    top: ksmallSpace,
                    right: ksmallSpace,
                    child: Visibility(
                      visible: _cateloge,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: _imagePageCountVisible ? 1 : 0,
                        child: Container(
                          width: 35,
                          padding: EdgeInsets.all(ksmallSpace),
                          decoration: BoxDecoration(
                            color: Color(0xFF121212).withOpacity(0.7),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(kmediumSpace),
                                right: Radius.circular(kmediumSpace)),
                          ),
                          child: Center(
                            child: Text(
                              _imagePageCount,
                              style: TextStyle(
                                color: Color(0xFFF9F9F9),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.width / 2 - 120,
                      left: MediaQuery.of(context).size.width / 2 - 40,
                      child: ScaleTransition(
                        scale: _animation,
                        child: Icon(Icons.favorite, size: 80),
                      )),
                ],
              );
            }),
          ),
          Container(
            padding: EdgeInsets.all(ksmallSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          _likedPost = !_likedPost;
                        })
                      },
                      onDoubleTap: () => {_controller},
                      child: _likedPost
                          ? Icon(
                              Icons.favorite,
                              size: klargeIconSize,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline_sharp,
                              size: klargeIconSize,
                            ),
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
                  softWrap: false,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: "joshua_l ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text:
                            "The game in Japan was amazing and I want to share some photos. "
                            "The game in Japan was amazing and I want to share some photos. "
                            "The game in Japan was amazing and I want to share some photos. "
                            "The game in Japan was amazing and I want to share some photos. "
                            "The game in Japan was amazing and I want to share some photos. ",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Text('more', style: Theme.of(context).textTheme.caption),
                SizedBox(
                  height: ksmallSpace,
                ),
                _hasComment
                    ? RichText(
                        text: TextSpan(children: [
                          TextSpan(text: 'View'),
                          TextSpan(text: " $_commentCount "),
                          TextSpan(
                              text: _commentCount > 1 ? "comment" : "comments")
                        ], style: Theme.of(context).textTheme.caption),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
