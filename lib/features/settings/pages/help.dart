import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kmediumSpace),
        child: Column(
          children: [
            Tile(label: "Report a Problem"),
            Tile(label: "Help Center"),
            Tile(label: "Support Requests"),
            Tile(label: "Privacy and Security Help"),
          ],
        ),
      ),
    );
  }
}
