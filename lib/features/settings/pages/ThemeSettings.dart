import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/features/settings/widget/custom_toggle.dart';

class ThemeSettings extends StatefulWidget {
  const ThemeSettings({Key key}) : super(key: key);

  @override
  _ThemeSettingsState createState() => _ThemeSettingsState();
}

class _ThemeSettingsState extends State<ThemeSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set Theme',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(ksmallSpace),
        child: Column(
          children: <Widget>[
            CustomToggle(
              options: ["Light", "Dark", "System Default"],
              spacing: 8.0,
              defaultSelectedIndex: 2,
              divides: false,
            ),
          ],
        ),
      ),
    );
  }
}
