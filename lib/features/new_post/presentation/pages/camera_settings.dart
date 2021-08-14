import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/settings/presentation/widget/custom_toggle.dart';

class CameraSettingsPage extends StatefulWidget {
  const CameraSettingsPage(
      {Key key, @required this.onChangeCameraToolSide, @required this.toolSide})
      : super(key: key);
  final VoidCallback onChangeCameraToolSide;
  final bool toolSide;

  @override
  _CameraSettingsPageState createState() => _CameraSettingsPageState();
}

class _CameraSettingsPageState extends State<CameraSettingsPage> {
  bool _isStartFrontCamera = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kmediumSpace,
                vertical: ksmallSpace,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Camera Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kmediumSpace),
              child: Column(
                children: [
                  Tile(
                    label: "Story",
                    leadingWidget: Icon(
                      Icons.add_circle_outline_outlined,
                    ),
                  ),
                  Tile(
                    label: "Reels",
                    leadingWidget: Icon(
                      Icons.video_collection_rounded,
                    ),
                  ),
                ],
              ),
            ),
            YMargin(
              ksmallSpace,
            ),
            Divider(
              height: 2,
              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kmediumSpace,
              ),
              child: Column(
                children: [
                  Tile(
                    label: "Controls",
                  ),
                  Tile(
                    label: "Always Start on Front Camera",
                    trailingWidget: Switch(
                      value: _isStartFrontCamera,
                      onChanged: (value) {
                        setState(() {
                          _isStartFrontCamera = !_isStartFrontCamera;
                        });
                        value = _isStartFrontCamera;
                      },
                      activeColor: Colors.blueAccent,
                    ),
                  ),
                  Tile(
                    label: "Camera Tools",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kmediumSpace,
              ),
              child: CustomToggle(
                labelWidget: Text(
                  "Choose which side of the screen you want your camera toolbar to be on",
                  style: Theme.of(context).textTheme.caption,
                ),
                defaultSelectedIndex: widget.toolSide ? 0 : 1,
                options: ["Left Side", "Right Side"],
                onChanged: widget.onChangeCameraToolSide,
              ),
            )
          ],
        ),
      ),
    );
  }
}
