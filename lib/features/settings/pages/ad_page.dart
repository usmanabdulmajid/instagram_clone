import 'package:flutter/material.dart';

class AdPage extends StatefulWidget {
  const AdPage({Key key}) : super(key: key);

  @override
  _AdPageState createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ads'),
      ),
      body: Container(),
    );
  }
}
