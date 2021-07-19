import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class ProfileTextWidget extends StatelessWidget {
  const ProfileTextWidget({
    Key key,
    @required this.darkModeOn,
    @required this.label,
    @required this.labelCount,
  }) : super(key: key);

  final bool darkModeOn;
  final String label;
  final String labelCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          labelCount,
          style: TextStyle(
            fontFamily: 'SFProText',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: darkModeOn ? AppColors.white : AppColors.black,
          ),
        ),
        YMargin(5),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'SFProText',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: darkModeOn ? AppColors.white : AppColors.black,
          ),
        ),
      ],
    );
  }
}
