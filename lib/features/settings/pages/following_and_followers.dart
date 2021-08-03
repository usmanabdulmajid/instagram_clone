import 'package:flutter/material.dart';
import 'package:instagram_clone/features/settings/widget/custom_toggle.dart';

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
        child: Column(children: <Widget>[
          CustomToggle(
            title: "New Followers",
            subtitle: "joshual_ started following you.",
            options: ["Off", "On"],
            selectedIndex: 1,
          ),
          CustomToggle(
            title: "Accepted Follow Requests",
            subtitle: "joshua_l accepted your friend request.",
            options: ["Off", "On"],
            selectedIndex: 1,
          ),
          CustomToggle(
            title: "Mention in Bio",
            subtitle: "joshua_l mentioned you in their bio.",
            options: ["Off", "From People I follow", "From Everyone"],
            selectedIndex: 2,
          ),
          CustomToggle(
            title: "Additional options in system settings",
            subtitle:
                "These settings may affect any Instagram accounts logged into this devices.",
            options: [],
            selectedIndex: 2,
          ),
        ]),
      ),
    );
  }
}
