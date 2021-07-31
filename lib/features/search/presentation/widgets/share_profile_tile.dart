import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class ShareProfileTile extends StatelessWidget {
  const ShareProfileTile(
      {Key key, @required this.selector, this.selected, this.onTap})
      : super(key: key);
  final bool selector;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kmediumSpace - ksmallSpace),
        child: ListTile(
          leading: CircleAvatar(
            radius: Sizing.xMargin(context, 12) / 2,
            backgroundColor: Colors.teal[900],
          ),
          title: Text("joshua_l"),
          subtitle: Text("joshua_l_official"),
          trailing: Container(
            padding: EdgeInsets.symmetric(
                horizontal: kmediumSpace, vertical: ksmallSpace),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(ksmallSpace / 4),
            ),
            child: Text(
              "Send",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
