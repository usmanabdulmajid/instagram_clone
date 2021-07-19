import 'package:flutter/material.dart';

class StoryRolls extends StatefulWidget {
  const StoryRolls({Key key, @required this.availableStatus}) : super(key: key);

  final int availableStatus;
  @override
  _StoryRollsState createState() => _StoryRollsState();
}

class _StoryRollsState extends State<StoryRolls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      height: 116.0,
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
                ? Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          Icon(
                            Icons.account_circle_sharp,
                            color: Colors.white,
                            size: 100,
                          ),
                          Positioned(
                            bottom: 6,
                            right: 6,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Center(
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        transform: GradientRotation(5.49778715),
                        colors: [
                          Colors.orange[500],
                          Colors.orange[700],
                          Colors.pink[400],
                          Colors.pinkAccent,
                        ],
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Container(
                        width: 94.0,
                        height: 94.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(94.0),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Theme.of(context).primaryColor,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
