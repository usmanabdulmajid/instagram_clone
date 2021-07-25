import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/modal_list_tile.dart';

Future buildActionModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: Sizing.yMargin(context, 40),
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
                    ),
                    ModalListTile(
                      onTap: () {},
                      label: 'Hide',
                    ),
                    ModalListTile(
                      onTap: () {},
                      label: 'Turn on Post Notifications',
                    ),
                    ModalListTile(
                      onTap: () {},
                      label: 'Copy Link',
                    ),
                    ModalListTile(
                      onTap: () {},
                      label: 'Share to',
                    ),
                    ModalListTile(
                      onTap: () {},
                      label: 'Unfollow',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
