import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/comment/widgets/reply_tile.dart';

class CommentTile extends StatefulWidget {
  const CommentTile({
    Key key,
    @required this.toggleReplyInput,
    @required this.toggleSelection,
    @required this.onSelection,
  }) : super(key: key);
  final VoidCallback toggleReplyInput;
  final VoidCallback toggleSelection;
  final bool onSelection;
  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  bool replyExpanded = false;
  bool more = false;
  List<Widget> replies = [];
  int shownedReplies = 3;
  bool selected = false;
  bool isPinned = false;

  bool likedComment = false;

  @override
  void initState() {
    replies = [
      ReplyTile(),
      ReplyTile(),
      ReplyTile(),
      ReplyTile(),
      ReplyTile(),
      ReplyTile(),
      ReplyTile(),
      ReplyTile(),
      ReplyTile(),
      ReplyTile(),
      ReplyTile(),
    ];
    if (replies.length > 3) more = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: ksmallSpace),
        width: Sizing.yMargin(context, 100),
        color: selected && widget.onSelection
            ? Theme.of(context).accentColor
            : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: ksmallSpace),
              child: Icon(
                Icons.account_circle,
                size: 48,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (!widget.onSelection) {
                              widget.toggleSelection();
                              setState(() {
                                selected = true;
                              });
                            } else if (selected) {
                              widget.toggleSelection();
                              setState(() {
                                selected = false;
                              });
                            }
                          },
                          child: RichText(
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
                                      "The game in Japan was amazing and I want to share some photos. ",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kmediumSpace),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              likedComment = !likedComment;
                            });
                          },
                          child: likedComment
                              ? CustomIcon(
                                  icon: "liked_filled",
                                  size: 14,
                                  color: Colors.red,
                                )
                              : CustomIcon(
                                  icon: "like",
                                  size: 14,
                                ),
                        ),
                      )
                    ],
                  ),
                  YMargin(ksmallSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "5h",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      XMargin(ksmallSpace),
                      Text(
                        "10 likes",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      if (isPinned) XMargin(ksmallSpace),
                      if (isPinned)
                        Text(
                          "📌Pinned",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      XMargin(ksmallSpace),
                      GestureDetector(
                        onTap: widget.toggleReplyInput,
                        child: Text(
                          "Reply",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                  YMargin(kmediumSpace),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            replyExpanded = !replyExpanded;
                            if (!replyExpanded) {
                              shownedReplies = 3;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 1,
                              color: Theme.of(context)
                                  .unselectedWidgetColor
                                  .withOpacity(0.2),
                            ),
                            XMargin(ksmallSpace),
                            Text(
                              replyExpanded
                                  ? "Hide replies"
                                  : "View ${replies.length} replies",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      if (replyExpanded) ...replies.take(shownedReplies),
                      if (replyExpanded &&
                          more &&
                          replies.length > shownedReplies)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (shownedReplies + 3 >= replies.length)
                                shownedReplies = replies.length;
                              else
                                shownedReplies += 3;
                            });
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 1,
                                  width: 30,
                                  color: Theme.of(context)
                                      .unselectedWidgetColor
                                      .withOpacity(0.4),
                                ),
                                XMargin(ksmallSpace),
                                Text(
                                  "View ${replies.length - shownedReplies} more replies",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
