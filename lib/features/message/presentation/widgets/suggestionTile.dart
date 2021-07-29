import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class SuggesstionTile extends StatelessWidget {
  const SuggesstionTile(
      {Key key, @required this.selector, this.selected, this.onTap})
      : super(key: key);
  final bool selector;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: ListTile(
          leading: CircleAvatar(
            radius: klargeIconSize,
            backgroundColor: Colors.teal[900],
          ),
          title: Text("joshua_l"),
          subtitle: Text("joshua_l_official"),
          trailing: selector
              ? selected ?? selector
                  ? Icon(Icons.circle, color: Colors.blueAccent)
                  : ClipOval(
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
                    )
              : Icon(
                  Icons.camera_alt_outlined,
                ),
        ),
      ),
    );
  }
}
