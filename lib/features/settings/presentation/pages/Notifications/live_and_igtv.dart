import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/settings/presentation/widget/custom_toggle.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(ksmallSpace),
          child: Column(children: <Widget>[
            CustomToggle(
              title: "Live Videos",
              subtitle:
                  "joshual_ started a live video watch it before it ends.",
              options: ["Off", "On"],
              defaultSelectedIndex: 1,
            ),
            CustomToggle(
              title: "IGTV Video Uploads",
              subtitle: "Your video is ready to watch on IGTV.",
              options: ["Off", "On"],
              defaultSelectedIndex: 1,
            ),
            CustomToggle(
              title: "IGTV View Counts",
              subtitle:
                  "Your IGTV video has more than 100k views: \"My New Video\".",
              options: ["Off", "On"],
              defaultSelectedIndex: 1,
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
