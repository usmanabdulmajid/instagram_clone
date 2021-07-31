import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class SuggesstionTile extends StatefulWidget {
  const SuggesstionTile(
      {Key key, @required this.selector, this.selected, this.onTap, this.title})
      : super(key: key);
  final String title;
  final bool selector;
  final bool selected;
  final void Function(String name, bool shouldAdd) onTap;

  @override
  _SuggesstionTileState createState() => _SuggesstionTileState();
}

class _SuggesstionTileState extends State<SuggesstionTile> {
  bool _selected;

  @override
  void initState() {
    _selected = widget.selected ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.selector && !_selected) {
          widget.onTap(widget.title, true);
          setState(() {
            _selected = true;
          });
        } else if (widget.selector) {
          widget.onTap(widget.title, false);
          setState(() {
            _selected = false;
          });
        }
      },
      child: Container(
        child: ListTile(
          leading: CircleAvatar(
            radius: klargeIconSize,
            backgroundColor: Colors.cyan[900],
          ),
          title: Text(widget.title ?? "joshua_l"),
          subtitle: Text("joshua_l_official"),
          trailing: widget.selector
              ? AnimatedCrossFade(
                  firstChild: ClipOval(
                    child: Container(
                      height: klargeIconSize,
                      width: klargeIconSize,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Icon(
                          Icons.check,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  secondChild: ClipOval(
                    child: Container(
                      height: klargeIconSize,
                      width: klargeIconSize,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.5,
                          color: Theme.of(context)
                              .unselectedWidgetColor
                              .withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(klargeIconSize),
                      ),
                    ),
                  ),
                  crossFadeState: _selected
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 200))
              : Icon(
                  Icons.camera_alt_outlined,
                ),
        ),
      ),
    );
  }
}
