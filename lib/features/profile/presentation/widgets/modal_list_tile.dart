import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';

class ModalListTile extends StatelessWidget {
  const ModalListTile({
    Key key,
    @required this.darkModeOn,
    @required this.leadingWidget,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  final bool darkModeOn;
  final String label;
  final Widget leadingWidget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: leadingWidget,
        horizontalTitleGap: 2,
        minVerticalPadding: 0,
        dense: true,
        title: Text(
          label,
          style: TextStyle(
            fontFamily: 'SFProText',
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: darkModeOn ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
