import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/message/presentation/widgets/suggestionTile.dart';

import '../../../../constants.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: ksmallSpace, horizontal: kmediumSpace + ksmallSpace),
            child: Column(
              children: [
                Container(
                  height: ksmallSpace * 4.5,
                  padding: EdgeInsets.symmetric(
                      vertical: ksmallSpace, horizontal: kmediumSpace),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(ksmallSpace)),
                    color: Theme.of(context)
                        .unselectedWidgetColor
                        .withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomIcon(icon: "search", size: 18),
                      XMargin(kmediumSpace),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).unselectedWidgetColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                YMargin(kmediumSpace * 2),
                Text(
                  "Message Friends with Direct",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                YMargin(kmediumSpace * 1.5),
                Text(
                  "Send private messages or share your favourite posts directly with friends",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 14),
                ),
                YMargin(kmediumSpace),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Send a Message",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
                YMargin(kmediumSpace * 2),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).accentColor,
          ),
          Padding(
            padding: const EdgeInsets.all(kmediumSpace + ksmallSpace),
            child: Text(
              "Suggestions",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SuggesstionTile(selector: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SuggesstionTile(selector: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SuggesstionTile(selector: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SuggesstionTile(selector: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SuggesstionTile(selector: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SuggesstionTile(selector: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SuggesstionTile(selector: false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SuggesstionTile(selector: false),
          ),
        ],
      ),
    );
  }
}
