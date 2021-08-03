import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.options,
    @required this.selectedIndex,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final int selectedIndex;
  final List<String> options;

  @override
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  String title;
  String subtitle;
  int selectedIndex;
  List<String> options;
  List<bool> isSelected = [];
  List<Widget> _optionChildren = [];
  @override
  void initState() {
    title = widget.title;
    subtitle = widget.subtitle;
    options = widget.options;
    selectedIndex = widget.selectedIndex;

    isSelected = [];
    _optionChildren = [];

    for (int i = 0; i < options.length; i++) {
      if (widget.selectedIndex == i) {
        isSelected.add(true);
      } else {
        isSelected.add(false);
      }
    }
    for (int i = 0; i < options.length; i++) {
      _optionChildren.add(
        StatefulBuilder(
          builder: (context, setState) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = i;
                for (int j = 0; j < isSelected.length; j++) {
                  if (j == i) {
                    isSelected[j] = true;
                  } else {
                    isSelected[j] = false;
                  }
                }
              });
            },
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    options[i],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                isSelected[i]
                    ? ClipOval(
                        child: Container(
                          height: kmediumSpace * 1.5,
                          width: kmediumSpace * 1.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context)
                                  .unselectedWidgetColor
                                  .withOpacity(0.2),
                            ),
                            borderRadius:
                                BorderRadius.circular(kmediumSpace * 1.5),
                            color: Colors.blueAccent,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: kmediumSpace * 1.5,
                        width: kmediumSpace * 1.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context)
                                .unselectedWidgetColor
                                .withOpacity(0.2),
                          ),
                          borderRadius:
                              BorderRadius.circular(kmediumSpace * 1.5),
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
      _optionChildren.add(YMargin(kmediumSpace));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ksmallSpace),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (_optionChildren.length > 0)
              YMargin(kmediumSpace * 2)
            else
              YMargin(kmediumSpace),
            ..._optionChildren,
            Text(
              subtitle,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 12),
            ),
            YMargin(kmediumSpace),
            Divider(
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
