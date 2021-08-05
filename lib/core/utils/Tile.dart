import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile(
      {Key key,
      this.title,
      this.leadingWidget,
      this.trailingWidget,
      this.titleWeight = FontWeight.normal,
      this.titleSize = 17,
      this.label,
      this.subtitle,
      this.onTap,
      this.color})
      : super(key: key);

  final String label;
  final Widget title;
  final String subtitle;
  final Widget leadingWidget;
  final Widget trailingWidget;
  final FontWeight titleWeight;
  final double titleSize;
  final VoidCallback onTap;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: leadingWidget,
        contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        horizontalTitleGap: 2,
        minVerticalPadding: 0,
        dense: true,
        subtitle: (subtitle != null)
            ? Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: titleSize - 2),
              )
            : null,
        title: title ??
            Text(
              label,
              style: color == null
                  ? Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: titleWeight, fontSize: titleSize)
                  : Theme.of(context).textTheme.headline5.copyWith(
                      color: color,
                      fontWeight: titleWeight,
                      fontSize: titleSize),
            ),
        trailing: trailingWidget ?? SizedBox(),
      ),
    );
  }
}
