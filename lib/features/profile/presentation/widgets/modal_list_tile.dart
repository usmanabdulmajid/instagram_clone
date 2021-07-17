import 'package:flutter/material.dart';
import 'package:instagram_clone/features/profile/presentation/pages/utils/colors.dart';

class ModalListTile extends StatelessWidget {
  const ModalListTile({
    Key key,
    @required this.darkModeOn,
    @required this.leadingWidget,
    @required this.label,
  }) : super(key: key);

  final bool darkModeOn;
  final String label;
  final Widget leadingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingWidget,
      horizontalTitleGap: 2,
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 17,
          fontWeight: FontWeight.normal,
          color: darkModeOn ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}
