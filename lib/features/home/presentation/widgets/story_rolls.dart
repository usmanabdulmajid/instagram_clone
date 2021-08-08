import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/profile_avatar.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class StoryRolls extends StatefulWidget {
  const StoryRolls({Key key, @required this.availableStatus}) : super(key: key);

  final int availableStatus;
  @override
  _StoryRollsState createState() => _StoryRollsState();
}

class _StoryRollsState extends State<StoryRolls> {
  @override
  Widget build(BuildContext context) {
    double size = Sizing.xMargin(context, 32) - (5 * 8);

    return Container(
      alignment: Alignment.center,
      height: Sizing.xMargin(context, 32),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.15,
            color: Color(0xFF9F9F9F),
          ),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: index == 0
                ? Column(
                    children: [
                      Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(size),
                        ),
                        child: Center(
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: size,
                                height: size,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(size),
                                ),
                              ),
                              Icon(
                                Icons.account_circle_sharp,
                                color: Colors.white,
                                size: size,
                              ),
                              Positioned(
                                bottom: size * 0.06,
                                right: size * 0.06,
                                child: Container(
                                  width: size * 0.25,
                                  height: size * 0.25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius:
                                        BorderRadius.circular(size * 0.25),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: size * 0.22,
                                      height: size * 0.22,
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(size * 0.22),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: size * 0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : ProfileAvatar(
                    size: size,
                    hasUserTag: true,
                    userTag: "joshua_l",
                  ),
          );
        },
      ),
    );
  }
}
