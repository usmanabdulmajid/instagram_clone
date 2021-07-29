import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class SuggesstionTile extends StatelessWidget {
  const SuggesstionTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          radius: klargeIconSize,
          backgroundColor: Colors.teal[900],
        ),
        title: Text("joshua_l"),
        subtitle: Text("joshua_l_official"),
        trailing: Icon(
          Icons.camera_alt_outlined,
        ),
      ),
    );
  }
}
