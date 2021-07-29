import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

import '../../../../constants.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(kmediumSpace * 4),
          child: Column(
            children: [
              YMargin(kmediumSpace),
              Text(
                "Video Chat With Anyone",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              YMargin(kmediumSpace),
              Text(
                "Share a link to invite anyone to video \n chat, even if they don\'t have instagram",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
              ),
              YMargin(kmediumSpace),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Create Room",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
