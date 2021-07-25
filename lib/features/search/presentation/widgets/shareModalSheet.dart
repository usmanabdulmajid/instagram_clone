import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/modal_list_tile.dart';

Future buildShareModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: Sizing.yMargin(context, 18),
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
                    ModalListTile(
                      onTap: () {},
                      label: 'Report...',
                      color: Colors.red,
                    ),
                    ModalListTile(
                      onTap: () {},
                      label: 'Not Interested',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
