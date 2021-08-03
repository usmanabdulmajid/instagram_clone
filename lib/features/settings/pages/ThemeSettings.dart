import 'package:flutter/material.dart';

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
        title: Text('Set Theme'),
      ),
      body: Container(),
    );
  }
}
