import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/settings/presentation/widget/custom_toggle.dart';

class FollowingAndFollower extends StatefulWidget {
  const FollowingAndFollower({Key key}) : super(key: key);

  @override
  _FollowingAndFollowerState createState() => _FollowingAndFollowerState();
}

class _FollowingAndFollowerState extends State<FollowingAndFollower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Following and Follower'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ksmallSpace),
          child: Column(children: <Widget>[
            CustomToggle(
              title: "New Followers",
              subtitle: "joshual_ started following you.",
              options: ["Off", "On"],
              defaultSelectedIndex: 1,
            ),
            CustomToggle(
              title: "Accepted Follow Requests",
              subtitle: "joshua_l accepted your friend request.",
              options: ["Off", "On"],
              defaultSelectedIndex: 1,
            ),
            CustomToggle(
              title: "Mention in Bio",
              subtitle: "joshua_l mentioned you in their bio.",
              options: ["Off", "From People I follow", "From Everyone"],
              defaultSelectedIndex: 2,
            ),
            CustomToggle(
              title: "Additional options in system settings",
              subtitle:
                  "These settings may affect any Instagram accounts logged into this devices.",
              options: [],
              defaultSelectedIndex: 2,
            ),
          ]),
        ),
      ),
    );
  }
}
