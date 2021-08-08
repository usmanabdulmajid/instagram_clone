import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({
    Key key,
    this.title,
    this.subtitle,
    this.options,
    this.defaultSelectedIndex,
    this.spacing = 0,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final int defaultSelectedIndex;
  final double spacing;
  final List<String> options;
  final VoidCallback onChanged;

  @override
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  String title;
  String subtitle;
  int defaultSelectedIndex;
  List<String> options;
  List<bool> isSelected = [];
  List<Widget> _optionChildren = [];
  double spacing = 0;

  @override
  void initState() {
    title = widget.title;
    subtitle = widget.subtitle;
    options = widget.options;
    defaultSelectedIndex = widget.defaultSelectedIndex;
    spacing = widget.spacing;

    isSelected = [];
    _optionChildren = [];

    for (int i = 0; i < options.length; i++) {
      isSelected.add(false);
    }
    if (options.length > 0) isSelected[defaultSelectedIndex] = true;

    super.initState();
  }

  List<Widget> _getOptions() {
    List<Widget> _options = [];
    for (int i = 0; i < options.length; i++) {
      _options.add(
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected[i] = true;
              for (int j = 0; j < isSelected.length; j++) {
                if (j != i) {
                  setState(() {
                    isSelected[j] = false;
                  });
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
                        color: Colors.blueAccent,
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
                        borderRadius: BorderRadius.circular(kmediumSpace * 1.5),
                      ),
                    ),
            ],
          ),
        ),
      );
      _options.add(YMargin(kmediumSpace + spacing));
    }
    return _options;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ksmallSpace),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (title != null)
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
            ..._getOptions(),
            if (subtitle != null)
              Text(
                subtitle,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 12),
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
