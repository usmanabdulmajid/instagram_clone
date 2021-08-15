import 'package:flutter/material.dart';

class PersonalInfoTileButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final String trailing;
  final Function onTap;

  const PersonalInfoTileButton(
      {this.title, this.subTitle, this.trailing, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.grey, height: 2.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.white,
                    height: 2.0,
                  ),
                ),
                trailing != null
                    ? Text(
                        trailing,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
