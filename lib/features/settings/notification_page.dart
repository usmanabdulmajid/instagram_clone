import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/modal_list_tile.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
      body: Padding(
        padding: EdgeInsets.all(ksmallSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YMargin(kmediumSpace),
            ModalListTile(
              label: "Push Notifications",
              onTap: () {},
            ),
            ModalListTile(
              label: "Pause All",
              onTap: () {},
            ),
            ModalListTile(
              label: "Post, Share and Comments",
              onTap: () {},
            ),
            ModalListTile(
              label: "Following and Follower",
              onTap: () {},
            ),
            ModalListTile(
              label: "Direct Messages",
              onTap: () {},
            ),
            ModalListTile(
              label: "Live and IGTV",
              onTap: () {},
            ),
            ModalListTile(
              label: "Fundraisers",
              onTap: () {},
            ),
            ModalListTile(
              label: "From Instagram",
              onTap: () {},
            ),
            Divider(
              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.7),
            ),
            YMargin(kmediumSpace * 2),
            Text(
              "Other Notification Types",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            ModalListTile(
              label: "Email and SMS",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
