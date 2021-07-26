import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class EmptyProfilePostsPage extends StatelessWidget {
  const EmptyProfilePostsPage({
    Key key,
    @required this.darkModeOn,
    @required this.darkIconTheme,
    @required this.lightIconTheme,
  }) : super(key: key);

  final bool darkModeOn;
  final String darkIconTheme;
  final String lightIconTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: darkModeOn ? AppColors.black : AppColors.white,
              shape: CircleBorder(
                side: BorderSide(
                    color: darkModeOn ? AppColors.white : AppColors.black,
                    width: 1.0),
              ),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: CustomIcon(icon: "add", size: 22),
                ),
              ),
            ),
            YMargin(15),
            Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'SFProText',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: darkModeOn ? AppColors.white : AppColors.black,
              ),
            ),
            YMargin(15),
            Text(
              'When you share photos and videos, they\'ll\nappear on your profile.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SFProText',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.textGrey,
              ),
            ),
            YMargin(15),
            Text(
              'Share your first photo or video',
              style: TextStyle(
                fontFamily: 'SFProText',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
