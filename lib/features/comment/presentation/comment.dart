import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/comment_text_input.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/profile_avatar.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/comment/widgets/comment_tile.dart';
import 'package:instagram_clone/features/search/presentation/widgets/shareModalSheet.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool _showReplyTo = false;
  bool _selectedComment = false;
  void applyhowReplyTo() {
    setState(() {
      _showReplyTo = true;
    });
  }

  void hidReplyTo() {
    setState(() {
      _showReplyTo = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _selectedComment
            ? IconButton(
                icon: Icon(Icons.close_outlined),
                onPressed: () {
                  setState(() {
                    _selectedComment = false;
                  });
                },
              )
            : null,
        title: Text(_selectedComment ? "1 Selected" : 'Comment'),
        backgroundColor:
            _selectedComment ? Colors.blue : Theme.of(context).primaryColor,
        actions: <Widget>[
          if (_selectedComment)
            IconButton(
                icon: Icon(Icons.notification_important_outlined),
                onPressed: () {}),
          if (!_selectedComment)
            Padding(
              padding: const EdgeInsets.all(ksmallSpace),
              child: GestureDetector(
                onTap: () {
                  buildShareModalBottomSheet(context);
                },
                child: CustomIcon(icon: "messenger"),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (ctx, index) => index == 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: ksmallSpace),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: ksmallSpace),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Theme.of(context)
                                  .unselectedWidgetColor
                                  .withOpacity(0.2),
                              width: 1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: ksmallSpace),
                            child: Icon(
                              Icons.account_circle_outlined,
                              size: 50,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  softWrap: false,
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(ctx).style,
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
                                            "The game in Japan was amazing and I want to share some photos. ",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                YMargin(ksmallSpace),
                                Text(
                                  "5h",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : CommentTile(
                    toggleReplyInput: applyhowReplyTo,
                    toggleSelection: () {
                      setState(() {
                        _selectedComment = !_selectedComment;
                      });
                    },
                    onSelection: _selectedComment,
                  ),
            itemCount: 10,
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: CommentTextInput(
              showReplyTo: _showReplyTo,
              onHideReplyTo: hidReplyTo,
            ),
          ),
        ],
      ),
    );
  }
}
