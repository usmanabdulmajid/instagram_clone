import 'package:flutter/material.dart';

class ModalListTile extends StatelessWidget {
  const ModalListTile(
      {Key key,
      this.leadingWidget,
      this.trailingWidget,
      @required this.label,
      @required this.onTap,
      this.color})
      : super(key: key);

  final String label;
  final Widget leadingWidget;
  final Widget trailingWidget;
  final VoidCallback onTap;
  final MaterialColor color;

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
          style: color == null
              ? Theme.of(context).textTheme.headline5
              : Theme.of(context).textTheme.headline5.copyWith(color: color),
        ),
        trailing: trailingWidget ?? SizedBox(),
      ),
    );
  }
}
