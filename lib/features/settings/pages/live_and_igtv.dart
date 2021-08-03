import 'package:flutter/material.dart';
import 'package:instagram_clone/features/settings/widget/custom_toggle.dart';

class LiveAndIGTV extends StatefulWidget {
  const LiveAndIGTV({Key key}) : super(key: key);

  @override
  _LiveAndIGTVState createState() => _LiveAndIGTVState();
}

class _LiveAndIGTVState extends State<LiveAndIGTV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live and IGTV'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          CustomToggle(
            title: "Live Videos",
            subtitle: "joshual_ started a live video watch it before it ends.",
            options: ["Off", "On"],
            selectedIndex: 1,
          ),
          CustomToggle(
            title: "IGTV Video Uploads",
            subtitle: "Your video is ready to watch on IGTV.",
            options: ["Off", "On"],
            selectedIndex: 1,
          ),
          CustomToggle(
            title: "Support Request",
            subtitle:
                "Your IGTV video has more than 100k views: \"My New Video\".",
            options: ["Off", "On"],
            selectedIndex: 1,
          ),
          CustomToggle(
            title: "Unrecognized Logins",
            subtitle:
                "An unrecognised Apple iPhone 11 has logged in from Foster City, CA USA.",
            options: ["Off", "Ons"],
            selectedIndex: 0,
          ),
        ]),
      ),
    );
  }
}
