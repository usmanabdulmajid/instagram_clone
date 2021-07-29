import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';

class ActivityTile extends StatelessWidget {
  final String timeframe;
  final String activity;
  final String suggestedActivity;
  final List<String> followers;
  final String suggestedFollower;
  final bool isFollowing;
  final DateTime dateTime;
  final bool hasCurrentStatusUpdate;

  const ActivityTile(
      {this.timeframe,
      this.activity,
      this.suggestedActivity,
      this.followers,
      this.suggestedFollower,
      this.isFollowing,
      this.dateTime,
      this.hasCurrentStatusUpdate});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    bool darkModeOn = brightness == Brightness.dark;
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: hasCurrentStatusUpdate
              ? LinearGradient(
                  transform: GradientRotation(5.49778715),
                  colors: [
                    Colors.orange[500],
                    Colors.orange[700],
                    Colors.pink[400],
                    Colors.pinkAccent,
                    Colors.pinkAccent,
                    Colors.purple[700],
                  ],
                )
              : null,
          //border: Border.all(color: Colors.transparent),
        ),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: darkModeOn ? AppColors.black : AppColors.white,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/selfie_test.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: RichText(
        text: TextSpan(
          text: activity,
          children: [
            TextSpan(
              text: ' ${followers[0]}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' and '),
            TextSpan(
              text: followers[1],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ',$suggestedActivity',
            ),
            TextSpan(
              text: ' $suggestedFollower',
            ),
            TextSpan(
              text: '. $timeframe',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
      trailing: isFollowing != null
          ? isFollowing
              ? SizedBox()
              : ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 28),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Follow',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
          : SizedBox(),
    );
  }
}
