import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/modal_list_tile.dart';

Future buildModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: Sizing.yMargin(context, 50),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                            color: AppColors.textGrey),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Create new',
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ),
                  YMargin(5),
                  Divider(),
                  YMargin(10),
                  ModalListTile(
                    onTap: () {},
                    label: 'Feed Post',
                    leadingWidget: Icon(
                      Icons.grid_on_outlined,
                      size: 25,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  ModalListTile(
                    onTap: () {},
                    label: 'Reel',
                    leadingWidget: Icon(
                      Icons.ondemand_video_outlined,
                      size: 25,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  ModalListTile(
                    onTap: () {},
                    label: 'Story',
                    leadingWidget: Icon(
                      Icons.add_circle_outline,
                      size: 25,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  ModalListTile(
                    onTap: () {},
                    label: 'Story Highlight',
                    leadingWidget: Icon(
                      Icons.add_circle_outline_outlined,
                      size: 25,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  ModalListTile(
                    onTap: () {},
                    label: 'IGTV video',
                    leadingWidget: Icon(
                      Icons.live_tv_outlined,
                      size: 25,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  ModalListTile(
                    onTap: () {},
                    label: 'Guide',
                    leadingWidget: Icon(
                      Icons.menu_book,
                      size: 25,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
            ));
      });
}
