import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key key}) : super(key: key);

  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool _isPauseAll;

  @override
  void initState() {
    _isPauseAll = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: .1,
              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.4),
            ),
            YMargin(kmediumSpace),
            Padding(
              padding: const EdgeInsets.all(ksmallSpace),
              child: Column(
                children: [
                  Tile(
                    label: "Account Privacy",
                    titleWeight: FontWeight.w600,
                    onTap: () {},
                  ),
                  Tile(
                      leadingWidget: Icon(Icons.lock_outline),
                      label: "Private Account",
                      onTap: () {},
                      trailingWidget: Switch(
                        value: _isPauseAll,
                        onChanged: (value) {
                          setState(() {
                            _isPauseAll = !_isPauseAll;
                          });
                          value = _isPauseAll;
                        },
                        activeColor: Colors.blueAccent,
                      )),
                  YMargin(kmediumSpace),
                  Divider(
                    height: .1,
                    color: Theme.of(context)
                        .unselectedWidgetColor
                        .withOpacity(0.4),
                  ),
                  Tile(
                    label: "Interactions",
                    titleWeight: FontWeight.w600,
                    onTap: () {},
                  ),
                  Tile(
                      leadingWidget: CustomIcon(icon: "comment"),
                      label: "Comments",
                      onTap: () {},
                      trailingWidget: Text("Everyone",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontSize: 12))),
                  Tile(
                    leadingWidget: CustomIcon(icon: "add"),
                    label: "Posts",
                    onTap: () {},
                  ),
                  Tile(
                    leadingWidget: Icon(Icons.email_outlined),
                    label: "Mentions",
                    onTap: () {},
                  ),
                  Tile(
                    leadingWidget: Icon(Icons.add_circle_outline),
                    label: "Story",
                    onTap: () {},
                  ),
                  Tile(
                    leadingWidget: Icon(Icons.video_collection),
                    label: "Reels",
                    onTap: () {},
                  ),
                  Tile(
                    leadingWidget: Icon(Icons.book_online_outlined),
                    label: "Guides",
                    onTap: () {},
                  ),
                  Tile(
                    leadingWidget: Icon(Icons.fact_check_sharp),
                    label: "Activity Status",
                    onTap: () {},
                  ),
                  Tile(
                    leadingWidget: CustomIcon(
                      icon: "messenger",
                    ),
                    label: "Messages",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Divider(
              height: .1,
              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.4),
            ),
            Tile(
              label: "Connections",
              titleWeight: FontWeight.w600,
              onTap: () {},
            ),
            Tile(
              leadingWidget: Icon(Icons.block_flipped),
              label: "Restricted Accounts",
              onTap: () {},
            ),
            Tile(
              leadingWidget: Icon(Icons.cancel_outlined),
              label: "Blocked ccounts",
              onTap: () {},
            ),
            Tile(
              leadingWidget: Icon(Icons.notifications_off_outlined),
              label: "Muted Accounts",
              onTap: () {},
            ),
            Tile(
              leadingWidget: Icon(Icons.people_outlined),
              label: "Accounts you Follow",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
