import 'package:flutter/material.dart';
import 'package:instagram_clone/features/profile/presentation/pages/utils/colors.dart';
import 'package:instagram_clone/features/profile/presentation/pages/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/modal_list_tile.dart';

Future buildModalBottomSheet(BuildContext context, bool darkModeOn) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: Sizing.yMargin(context, 50),
            color: darkModeOn ? AppColors.black : AppColors.white,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: darkModeOn ? AppColors.darkStoryGrey : AppColors.white,
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
                      style: TextStyle(
                        fontFamily: 'SFProText',
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color:
                            darkModeOn ? AppColors.textGrey : AppColors.black,
                      ),
                    ),
                  ),
                  YMargin(5),
                  Divider(
                    color: darkModeOn ? AppColors.textGrey : AppColors.black,
                  ),
                  YMargin(10),
                  ModalListTile(
                    onTap: () {},
                    darkModeOn: darkModeOn,
                    label: 'Feed Post',
                    leadingWidget: Icon(Icons.grid_on_outlined,
                        size: 25,
                        color: darkModeOn ? AppColors.white : AppColors.black),
                  ),
                  ModalListTile(
                    onTap: () {},
                    darkModeOn: darkModeOn,
                    label: 'Reel',
                    leadingWidget: Icon(Icons.ondemand_video_outlined,
                        size: 25,
                        color: darkModeOn ? AppColors.white : AppColors.black),
                  ),
                  ModalListTile(
                    onTap: () {},
                    darkModeOn: darkModeOn,
                    label: 'Story',
                    leadingWidget: Icon(Icons.add_circle_outline,
                        size: 25,
                        color: darkModeOn ? AppColors.white : AppColors.black),
                  ),
                  ModalListTile(
                    onTap: () {},
                    darkModeOn: darkModeOn,
                    label: 'Story Highlight',
                    leadingWidget: Icon(Icons.add_circle_outline_outlined,
                        size: 25,
                        color: darkModeOn ? AppColors.white : AppColors.black),
                  ),
                  ModalListTile(
                    onTap: () {},
                    darkModeOn: darkModeOn,
                    label: 'IGTV video',
                    leadingWidget: Icon(Icons.live_tv_outlined,
                        size: 25,
                        color: darkModeOn ? AppColors.white : AppColors.black),
                  ),
                  ModalListTile(
                    onTap: () {},
                    darkModeOn: darkModeOn,
                    label: 'Guide',
                    leadingWidget: Icon(Icons.menu_book,
                        size: 25,
                        color: darkModeOn ? AppColors.white : AppColors.black),
                  ),
                ],
              ),
            ));
      });
}
