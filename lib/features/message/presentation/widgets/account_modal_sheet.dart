import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/modal_list_tile.dart';

Future buildChangeAccountModal(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: Sizing.yMargin(context, 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: Theme.of(context).accentColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Container(
                    width: 35,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).unselectedWidgetColor),
                  ),
                ),
              ),
              YMargin(10),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kmediumSpace),
                      child: Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.teal[900],
                          radius: klargeIconSize,
                        ),
                        XMargin(kmediumSpace),
                        Text(
                          "joshua_l",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.circle_notifications),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(kmediumSpace),
                      child: Row(children: [
                        ClipOval(
                          child: Center(
                            child: Container(
                              width: klargeIconSize * 2,
                              height: klargeIconSize * 2,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context)
                                        .unselectedWidgetColor
                                        .withOpacity(0.2)),
                                borderRadius:
                                    BorderRadius.circular(klargeIconSize * 2),
                              ),
                              child: Icon(
                                Icons.add,
                                size: klargeIconSize * 1.5,
                              ),
                            ),
                          ),
                        ),
                        XMargin(kmediumSpace),
                        Text(
                          "Add Account",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
