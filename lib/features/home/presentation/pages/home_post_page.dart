import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/comment_text_input.dart';
import 'package:instagram_clone/core/utils/constants.dart';
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
  TextEditingController commentBoxController;
  ScrollController _controller;
  bool _onAddComment = false;
  bool _canPostComment = false;

  @override
  void initState() {
    _controller = ScrollController();
    commentBoxController = TextEditingController(text: "");
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
        GestureDetector(
          onTap: () {
            if (_onAddComment) {
              setState(() {
                _onAddComment = false;
              });
              FocusScope.of(context).unfocus();
            }
          },
          child: CustomScrollView(
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
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          bottom: _onAddComment ? 0 : -Sizing.yMargin(context, 15),
          child: CommentTextInput(),
        )
      ],
    );
  }
}
