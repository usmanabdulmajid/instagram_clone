import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: 0,
          title: Text("Instagram"),
          pinned: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: widget.addPostCallback,
            ),
            IconButton(
              icon: Icon(Icons.send_outlined),
              onPressed: widget.gotoMessageCallback,
            )
          ],
        ),
        SliverToBoxAdapter(
          child: StoryRolls(
            availableStatus: 10,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, index) => ImagePost(),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
