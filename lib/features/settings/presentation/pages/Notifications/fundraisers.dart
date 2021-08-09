import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/settings/presentation/widget/custom_toggle.dart';

class Fundraisers extends StatefulWidget {
  const Fundraisers({Key key}) : super(key: key);

  @override
  _FundraisersState createState() => _FundraisersState();
}

class _FundraisersState extends State<Fundraisers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundraisers'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ksmallSpace),
          child: Column(children: <Widget>[
            CustomToggle(
              title: "Your Fundraisers",
              subtitle: "joshua_l donated to your your fundraiser.",
              options: ["Off", "On"],
              defaultSelectedIndex: 1,
            ),
            CustomToggle(
              title: "Fundraisers by Others",
              subtitle: "joshual_l started a fundraiser.",
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
