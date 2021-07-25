import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/icons.dart';
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
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      controller: _controller,
      slivers: [
        SliverAppBar(
          elevation: 0,
          title: CustomIcon(
            icon: "Instagram_logo",
            size: 100,
          ),
          pinned: true,
          actions: [
            GestureDetector(
              onTap: widget.addPostCallback,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomIcon(icon: "add", size: 22),
              ),
            ),
            GestureDetector(
              onTap: widget.gotoMessageCallback,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomIcon(icon: "messenger", size: 22),
              ),
            ),
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
            ),
            childCount: 10,
            addAutomaticKeepAlives: true,
            addRepaintBoundaries: true,
          ),
        ),
      ],
    );
  }
}
