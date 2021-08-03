import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/settings/pages/fundraisers.dart';

import 'emailandsms.dart';
import 'from_instagram.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
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
                  label: "Push Notifications",
                  titleWeight: FontWeight.w600,
                  onTap: () {},
                ),
                Tile(
                    label: "Pause All",
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
                Tile(
                  label: "Post, Share and Comments",
                  onTap: () {},
                ),
                Tile(
                  label: "Following and Follower",
                  onTap: () {},
                ),
                Tile(
                  label: "Direct Messages",
                  onTap: () {},
                ),
                Tile(
                  label: "Live and IGTV",
                  onTap: () {},
                ),
                Tile(
                  label: "Fundraisers",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Fundraisers(),
                      ),
                    );
                  },
                ),
                Tile(
                  label: "From Instagram",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => FromInstagramPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Divider(
            height: .1,
            color: Theme.of(context).unselectedWidgetColor.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Tile(
                  label: "Other Notification Types",
                  titleWeight: FontWeight.w500,
                ),
                Tile(
                  label: "Email and SMS",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => EmailAndSMS()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
