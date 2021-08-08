import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/comment_text_input.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/icons.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(ksmallSpace),
            child: CustomIcon(icon: "messenger"),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: CommentTextInput(),
          ),
        ],
      ),
    );
  }
}
