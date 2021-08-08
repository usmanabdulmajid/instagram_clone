import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

import 'constants.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar(
      {Key key, @required this.size, this.hasUserTag, this.userTag})
      : super(key: key);
  final double size;
  final bool hasUserTag;
  final String userTag;

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  double _avatarSize;
  bool _hasStatus = true;
  bool _hasPhoto = true;
  bool _hasUserTag = false;

  String userTag;

  @override
  void initState() {
    _avatarSize = widget.size;
    _hasStatus = true;
    _hasPhoto = false;
    _hasUserTag = widget.hasUserTag;
    userTag = widget.userTag;

    //Check if user has a photo
    //Check if user has a status

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _hasStatus
        ? Column(
            children: [
              ClipOval(
                child: Container(
                  width: _avatarSize,
                  height: _avatarSize,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      transform: GradientRotation(5.49778715),
                      colors: [
                        Colors.orange[500],
                        Colors.orange[700],
                        Colors.pink[400],
                        Colors.pinkAccent,
                        Colors.pinkAccent,
                        Colors.purple[700],
                      ],
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(_avatarSize),
                  ),
                  child: Center(
                    child: Container(
                      width: _avatarSize * 0.94,
                      height: _avatarSize * 0.94,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(_avatarSize * 0.94),
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Theme.of(context).primaryColor,
                          width: _avatarSize * 0.04,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: _avatarSize * 0.80,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (_hasUserTag) YMargin(ksmallSpace),
              if (_hasUserTag) Text(userTag)
            ],
          )
        : Icon(
            Icons.account_circle,
            size: _avatarSize,
          );
  }
}
