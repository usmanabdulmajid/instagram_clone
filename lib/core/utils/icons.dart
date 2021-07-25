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
            width: size ?? 24,
            height: size ?? 24,
            child: SvgPicture.asset(
              "assets/icons/svg/$icon.svg",
              color: color ?? Theme.of(context).iconTheme.color,
            ),
          )
        : AnimatedCrossFade(
            firstChild: Container(
              width: size ?? 24,
              height: size ?? 24,
              child: SvgPicture.asset(
                "assets/icons/svg/$icon.svg",
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            secondChild: Container(
              width: size ?? 24,
              height: size ?? 24,
              child: SvgPicture.asset(
                "assets/icons/svg/$iconAccent.svg",
                color: color ?? Theme.of(context).iconTheme.color,
              ),
            ),
            crossFadeState: showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 200),
          );
  }
}

class IconPainter extends CustomPainter {
  const IconPainter({Key key, @required this.color, @required this.icon});

  final Color color;
  final Path icon;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.fill;

    canvas.drawPath(icon, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
