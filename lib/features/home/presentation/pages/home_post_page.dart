import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/home/presentation/widgets/ImagePost.dart';
import 'package:instagram_clone/features/home/presentation/widgets/story_rolls.dart';

class HomePostPage extends StatefulWidget {
  HomePostPage(
      {Key key,
      @required this.addPostCallback,
      @required this.gotoMessageCallback})
      : super(key: key);
  final VoidCallback addPostCallback;
  final VoidCallback gotoMessageCallback;

  @override
  _HomePostPageState createState() => _HomePostPageState();
}

class _HomePostPageState extends State<HomePostPage> {
  TextEditingController _searchBoxController;
  ScrollController _controller;
  bool _onAddComment = false;

  @override
  void initState() {
    _controller = ScrollController();
    _searchBoxController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showCommentBox() {
    setState(() {
      _onAddComment = !_onAddComment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          slivers: [
            SliverAppBar(
              elevation: 4.0,
              title: GestureDetector(
                onTap: () {
                  _controller.animateTo(0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInToLinear);
                },
                child: CustomIcon(
                  icon: "Instagram_logo",
                  size: 120,
                ),
              ),
              pinned: true,
              actions: [
                GestureDetector(
                  onTap: widget.addPostCallback,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: ksmallSpace),
                    child: CustomIcon(icon: "add", size: 24),
                  ),
                ),
                GestureDetector(
                  onTap: widget.gotoMessageCallback,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: ksmallSpace),
                    child: CustomIcon(icon: "messenger", size: 24),
                  ),
                ),
                XMargin(ksmallSpace),
              ],
            ),
            SliverToBoxAdapter(
              child: StoryRolls(
                availableStatus: 10,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) => ImagePost(
                  key: PageStorageKey(index),
                  showComment: _showCommentBox,
                ),
                childCount: 10,
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
              ),
            ),
          ],
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          bottom: _onAddComment ? 0 : -Sizing.yMargin(context, 15),
          child: Container(
            // height: Sizing.yMargin(context, 15),
            width: Sizing.xMargin(context, 100),
            padding: EdgeInsets.only(
              top: kmediumSpace,
              left: ksmallSpace,
              right: ksmallSpace,
              bottom: ksmallSpace,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    FittedBox(
                        child: Text(
                      "😍",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                  ],
                ),
                YMargin(ksmallSpace),
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.cyan[900],
                      ),
                      XMargin(kmediumSpace),
                      Expanded(
                        child: Container(
                          child: TextField(
                            autofocus: true,
                            controller: _searchBoxController,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              paste: true,
                              selectAll: true,
                              cut: true,
                            ),
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: "Add a comment...",
                              labelStyle: Theme.of(context).textTheme.bodyText1,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .unselectedWidgetColor
                                    .withOpacity(0.4),
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).unselectedWidgetColor,
                            ),
                          ),
                        ),
                      ),
                      XMargin(kmediumSpace),
                      GestureDetector(
                        onTap: () => _showCommentBox(),
                        child: Container(
                          child: Text(
                            "Post",
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: _searchBoxController.text.length > 0
                                    ? Colors.blueAccent
                                    : Colors.blueAccent.withOpacity(0.4)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
