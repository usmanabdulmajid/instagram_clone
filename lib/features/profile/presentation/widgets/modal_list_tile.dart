import 'package:flutter/material.dart';
import 'package:instagram_clone/features/profile/presentation/pages/utils/colors.dart';

class ModalListTile extends StatelessWidget {
  const ModalListTile({
    Key key,
    @required this.leadingWidget,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

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
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
