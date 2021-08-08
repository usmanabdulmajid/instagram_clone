import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/profile_avatar.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/comment/widgets/reply_tile.dart';

class CommentTile extends StatefulWidget {
  const CommentTile({Key key}) : super(key: key);

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  bool replyExpanded = false;
  List<Widget> replies = [ReplyTile(), ReplyTile(), ReplyTile()];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ksmallSpace),
      child: Container(
          width: Sizing.yMargin(context, 100),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kmediumSpace),
                          child: CustomIcon(icon: "like", size: 14),
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
                        XMargin(ksmallSpace),
                        Text(
                          "Reply",
                          style: Theme.of(context).textTheme.caption,
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
                                    : "View 3 replies",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        if (replyExpanded) ...replies
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
