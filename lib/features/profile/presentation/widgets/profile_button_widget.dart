import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    Key key,
    @required this.darkModeOn,
    @required this.label,
  }) : super(key: key);

  final bool darkModeOn;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: darkModeOn ? AppColors.white : AppColors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(
            vertical: 5, horizontal: Sizing.xMargin(context, 8)),
        textStyle: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: darkModeOn ? AppColors.white : AppColors.black,
        ),
        primary: darkModeOn ? AppColors.black : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            width: 1.2,
            color: darkModeOn ? AppColors.darkStoryGrey : AppColors.borderGrey,
          ),
        ),
      ),
    );
  }
}
