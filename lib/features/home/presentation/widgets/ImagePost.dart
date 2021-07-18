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
  bool _addedToCollection = false;
  bool _hasComment = false;
  bool _hasSound = true;
  bool _disabledSound = false;
  bool _soundIndicatorVisible = false;
  bool _isItv = false;
  bool _isWatchTv = false;
  int _commentCount = 3;
  int _imageCount = 3;
  int _currentImagePageNumber = 1;
  String _imagePageCount = "";
  Size _imageSize;

  AnimationController _likedController;
  Animation<double> _likedAnimation;

  AnimationController _collectionController;
  @override
  void initState() {
    super.initState();
    _likedController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _likedAnimation = CurvedAnimation(
      parent: _likedController,
      curve: Curves.bounceOut,
    );
    _collectionController = AnimationController(
      duration: const Duration(milliseconds: 950),
      vsync: this,
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
    _likedController.dispose();
    _collectionController.dispose();
  }

  List<Widget> getCatelogIndicator(int length) {
    List<Widget> indicator = [];
    for (var i = 0; i < length; i++) {
      indicator.add(
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 2.5),
          width: _currentImagePageNumber - 1 == i ? 7 : 5,
          height: _currentImagePageNumber - 1 == i ? 7 : 5,
          decoration: BoxDecoration(
            color: _currentImagePageNumber - 1 == i
                ? Colors.blueAccent
                : Colors.grey,
            borderRadius:
                BorderRadius.circular(_currentImagePageNumber - 1 == i ? 7 : 5),
          ),
        ),
      );
    }
    return indicator;
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
                  if (_imagePageCountVisible) {
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        _imagePageCountVisible = false;
                      });
                    });
                  }
                }
                if (_isItv) {
                  _isWatchTv = !_isWatchTv;
                  if (_isWatchTv) {
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        _isWatchTv = false;
                      });
                    });
                  }
                }

                if (_hasSound && !_soundIndicatorVisible) {
                  _disabledSound = !_disabledSound;
                  _soundIndicatorVisible = !_soundIndicatorVisible;
                  if (_soundIndicatorVisible) {
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        _soundIndicatorVisible = false;
                      });
                    });
                  }
                }
                if (_hasSound) {
                  _disabledSound = !_disabledSound;
                }
              })
            },
            onDoubleTap: () => {
              if (!_likedPost)
                {
                  setState(() {
                    _likedPost = true;
                    _likedController
                        .forward()
                        .whenComplete(() => _likedController.reset());
                  })
                }
              else
                {
                  setState(() {
                    _likedController
                        .forward()
                        .whenComplete(() => _likedController.reset());
                  })
                }
            },
            child: Builder(
              builder: (BuildContext ctx) {
                return Stack(
                  fit: StackFit.passthrough,
                  children: [
                    _cateloge
                        ? ConstrainedBox(
                            constraints: BoxConstraints.tight(
                                Size(MediaQuery.of(context).size.width, 250)),
                            child: PageView(
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentImagePageNumber = index + 1;
                                  _imagePageCount =
                                      "$_currentImagePageNumber/$_imageCount";
                                });
                              },
                              children: [
                                Container(
                                  color: Colors.amber,
                                ),
                                Container(
                                  color: Colors.blueAccent,
                                ),
                                Container(
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                          )
                        : Image.asset("assets/images/selfie_test.jpg"),
                    Positioned(
                      top: ksmallSpace,
                      right: ksmallSpace,
                      child: Visibility(
                        visible: _cateloge,
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
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
                      left: ksmallSpace,
                      bottom: ksmallSpace,
                      child: Visibility(
                        visible: _isItv && _isWatchTv,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFF121212).withOpacity(0.7),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(kmediumSpace),
                                right: Radius.circular(kmediumSpace)),
                          ),
                          child: Icon(
                            Icons.live_tv_rounded,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width / 2 - 120,
                      left: MediaQuery.of(context).size.width / 2 - 40,
                      child: ScaleTransition(
                        scale: _likedAnimation,
                        child: Icon(Icons.favorite, size: 100),
                      ),
                    ),
                    Positioned(
                      bottom: ksmallSpace,
                      right: ksmallSpace,
                      child: Visibility(
                        visible: _hasSound && _soundIndicatorVisible,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Color(0xFF121212).withOpacity(0.7),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(kmediumSpace),
                                right: Radius.circular(kmediumSpace)),
                          ),
                          child: Icon(
                            _disabledSound ? Icons.volume_up : Icons.volume_off,
                          ),
                        ),
                      ),
                    ),
                    PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromLTRB(0, 250.0 + 50, 0, -50),
                        end: RelativeRect.fromLTRB(0, 250.0 - 49, 0, 0),
                      ).animate(
                        CurvedAnimation(
                          parent: _collectionController,
                          curve: Curves.easeInBack,
                        ),
                      ),
                      child: Container(
                        color: Colors.black,
                        height: 50,
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/selfie_test.jpg",
                            height: 36,
                            width: 36,
                          ),
                          title: Text("Saved"),
                          trailing: Text("Save to collections"),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(ksmallSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          _likedPost = !_likedPost;
                          if (_likedPost) {
                            _likedController
                                .forward()
                                .whenComplete(() => _likedController.reset());
                          }
                        })
                      },
                      onDoubleTap: () => {_likedController},
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
                      child: Visibility(
                        visible: _cateloge,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: getCatelogIndicator(_imageCount)),
                      ),
                    ),
                    SizedBox(
                      width: klargeIconSize,
                    ),
                    SizedBox(
                      width: klargeIconSize,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!_addedToCollection) {
                          _collectionController.forward()
                            ..whenComplete(
                              () => Future.delayed(
                                Duration(seconds: 2),
                                _collectionController.reverse,
                              ),
                            );
                        }
                        setState(() {
                          _addedToCollection = !_addedToCollection;
                        });
                      },
                      child: Icon(
                        _addedToCollection
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        size: klargeIconSize,
                      ),
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
