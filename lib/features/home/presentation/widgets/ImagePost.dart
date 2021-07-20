import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/features/home/presentation/widgets/video_post.dart';

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
  int _commentCount = 3;
  int _imageCount = 3;
  int _currentImagePageNumber = 1;
  String _imagePageCount = "";

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

  List<Widget> _getCatelogChildren(int length) {
    List<bool> isVideo = [false, true, false];
    List<MaterialColor> file = [
      Colors.amber,
      Colors.blue[450],
      Colors.blueGrey
    ];
    List<Widget> children = [];
    int i = 0;
    for (var item in isVideo) {
      children.add(
        item
            ? VideoPost()
            : Container(
                color: file[i],
              ),
      );
      i++;
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            children: _getCatelogChildren(_imageCount),
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
                            color: Colors.black54,
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
                      scale: _likedAnimation,
                      child: Icon(
                        Icons.favorite,
                        size: 100,
                        color: Colors.white,
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
                      color: Theme.of(context).primaryColor,
                      height: 50,
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/selfie_test.jpg",
                          height: 36,
                          width: 36,
                        ),
                        title: Text(
                          "Saved",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "Save to collections",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w100),
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
    );
  }
}
