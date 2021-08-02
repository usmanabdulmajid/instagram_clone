import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
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
      padding: EdgeInsets.all(3.0),
      height: Sizing.xMargin(context, 33),
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
                : Column(
                    children: [
                      ClipOval(
                        child: Container(
                          width: size,
                          height: size,
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
                            borderRadius: BorderRadius.circular(size),
                          ),
                          child: Center(
                            child: Container(
                              width: size * 0.94,
                              height: size * 0.94,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(size * 0.94),
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Theme.of(context).primaryColor,
                                  width: size * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      YMargin(ksmallSpace),
                      Text("joshua_l")
                    ],
                  ),
          );
        },
      ),
    );
  }
}
