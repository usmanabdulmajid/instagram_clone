import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kmediumSpace),
        child: Column(
          children: [
            Tile(label: "App Update"),
            Tile(label: "Data Policy"),
            Tile(label: "Terms of Use"),
            Tile(label: "Open Source Libraries"),
          ],
        ),
      ),
    );
  }
}
