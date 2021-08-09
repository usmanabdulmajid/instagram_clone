import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

import 'constants.dart';

class CommentTextInput extends StatefulWidget {
  const CommentTextInput(
      {Key key,
      this.showReplyTo = false,
      this.replyTo = "",
      this.onHideReplyTo})
      : super(key: key);
  final bool showReplyTo;
  final String replyTo;
  final VoidCallback onHideReplyTo;
  @override
  _CommentTextInputState createState() => _CommentTextInputState();
}

class _CommentTextInputState extends State<CommentTextInput>
    with TickerProviderStateMixin {
  bool _canPostComment = false;
  bool _showCommentBox = false;
  bool _onAddComment = false;
  TextEditingController _commentBoxController;

  @override
  void initState() {
    _commentBoxController = TextEditingController();
    if (widget.showReplyTo) _commentBoxController.text = "@" + widget.replyTo;

    super.initState();
  }

  @override
  void dispose() {
    _commentBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          Container(
            height: widget.showReplyTo ? null : 0,
            width: Sizing.xMargin(context, 100),
            child: Padding(
              padding: const EdgeInsets.all(kmediumSpace),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Replying to ${widget.replyTo}",
                    style: TextStyle(
                      color: Theme.of(context)
                          .unselectedWidgetColor
                          .withOpacity(0.4),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: widget.onHideReplyTo,
                    child: Container(
                      child: Icon(
                        Icons.close_outlined,
                        color:
                            Theme.of(context).iconTheme.color.withOpacity(0.7),
                        size: widget.showReplyTo ? null : 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: Sizing.xMargin(context, 100),
            padding: EdgeInsets.only(
              top: kmediumSpace,
              left: ksmallSpace,
              right: ksmallSpace,
              bottom: ksmallSpace,
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
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: Text(
                        "🌚",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: Text(
                        "🙌",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: Text(
                        "👍🏾",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: Text(
                        "🙏🏾",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: Text(
                        "♥️",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: Text(
                        "😂",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Spacer(),
                    FittedBox(
                      child: Text(
                        "🙄",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                YMargin(ksmallSpace),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: ksmallSpace),
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
                            autofocus: _onAddComment,
                            controller: _commentBoxController,
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              paste: true,
                              selectAll: true,
                              cut: true,
                            ),
                            onChanged: (value) {
                              setState(() {
                                if (value.length > 0) {
                                  _canPostComment = true;
                                } else {
                                  _canPostComment = false;
                                }
                              });
                            },
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
                        child: Container(
                          child: Text(
                            "Post",
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: _canPostComment
                                  ? Colors.blueAccent
                                  : Colors.blueAccent.withOpacity(0.4),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
