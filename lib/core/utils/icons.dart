import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key key,
    @required this.icon,
    this.size,
    this.color,
    this.iconAccent,
    this.showFirst,
    this.isNotFaded = true,
  }) : super(key: key);
  final String icon;
  final double size;
  final MaterialColor color;
  final String iconAccent;
  final bool showFirst;
  final bool isNotFaded;

  @override
  Widget build(BuildContext context) {
    return isNotFaded
        ? Container(
            child: SvgPicture.asset(
              "assets/icons/svg/$icon.svg",
              color: color ?? Theme.of(context).iconTheme.color,
              width: size ?? 24,
            ),
          )
        : AnimatedCrossFade(
            firstChild: Container(
              child: SvgPicture.asset(
                "assets/icons/svg/$icon.svg",
                color: Theme.of(context).iconTheme.color,
                width: size ?? 24,
              ),
            ),
            secondChild: Container(
              child: SvgPicture.asset(
                "assets/icons/svg/$iconAccent.svg",
                color: color ?? Theme.of(context).iconTheme.color,
                width: size ?? 24,
              ),
            ),
            crossFadeState: showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 200),
          );
  }
}
