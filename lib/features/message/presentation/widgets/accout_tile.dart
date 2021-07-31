import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({Key key, @required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ksmallSpace / 2),
      child: Container(
        // height: kmediumSpace,
        padding: const EdgeInsets.symmetric(
            vertical: ksmallSpace, horizontal: kmediumSpace),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              transform: GradientRotation(5.49778715),
              colors: [
                Colors.blue,
                // Colors.lightBlue,
                Colors.lightBlueAccent,
              ],
            ),
            borderRadius: BorderRadius.circular(kmediumSpace)),
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
