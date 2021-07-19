import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/empty_profile_posts_page.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/empty_profile_tag_page.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/menu_modal_sheet.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/modal_bottom_sheet.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/profile_button_widget.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/profile_text_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool onTapStoryHighlight = false;
  String darkIconTheme = 'assets/icons/dark-theme';
  String lightIconTheme = 'assets/icons/light-theme';
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: darkModeOn ? AppColors.black : AppColors.white,
      appBar: AppBar(
        backgroundColor: darkModeOn ? AppColors.black : AppColors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () async {
              await buildModalBottomSheet(context, darkModeOn);
            },
            child: Container(
                child: darkModeOn
                    ? Image.asset("$darkIconTheme/add.png")
                    : Image.asset("$lightIconTheme/add-light.png")),
          ),
          GestureDetector(
            onTap: () async {
              await buildMenuModalBottomSheet(context, darkModeOn);
            },
            child: Container(
                child: darkModeOn
                    ? Image.asset("$darkIconTheme/menu.png")
                    : Image.asset("$lightIconTheme/menu-light.png")),
          ),
        ],
        title: Text(
          'iloveteajay',
          style: TextStyle(
            fontFamily: 'SFProText',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: darkModeOn ? AppColors.white : AppColors.black,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                                color: darkModeOn
                                    ? AppColors.darkStoryGrey
                                    : AppColors.borderGrey),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text(
                                  'View professional dashboard',
                                  style: TextStyle(
                                    fontFamily: 'SFProText',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lightBlue,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                                color: darkModeOn
                                    ? AppColors.darkStoryGrey
                                    : AppColors.borderGrey),
                            YMargin(10),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.grey,
                                        radius: 45,
                                      ),
                                      XMargin(20),
                                      ProfileTextWidget(
                                        darkModeOn: darkModeOn,
                                        label: 'Posts',
                                        labelCount: '0',
                                      ),
                                      XMargin(20),
                                      ProfileTextWidget(
                                        darkModeOn: darkModeOn,
                                        label: 'Followers',
                                        labelCount: '1,118',
                                      ),
                                      XMargin(20),
                                      ProfileTextWidget(
                                        darkModeOn: darkModeOn,
                                        label: 'Following',
                                        labelCount: '841',
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            YMargin(5),
                            Text(
                              'TAY',
                              style: TextStyle(
                                fontFamily: 'SFProText',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: darkModeOn
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            YMargin(2),
                            Text(
                              'Personal Blog',
                              style: TextStyle(
                                fontFamily: 'SFProText',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.textGrey,
                              ),
                            ),
                            YMargin(2),
                            Text(
                              'flutter and vibes',
                              style: TextStyle(
                                fontFamily: 'SFProText',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: darkModeOn
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            YMargin(20),
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileButtonWidget(
                                    darkModeOn: darkModeOn,
                                    label: 'Edit Profile',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ProfileButtonWidget(
                                        darkModeOn: darkModeOn,
                                        label: 'Promotions',
                                      ),
                                      ProfileButtonWidget(
                                        darkModeOn: darkModeOn,
                                        label: 'Insights',
                                      ),
                                      ProfileButtonWidget(
                                        darkModeOn: darkModeOn,
                                        label: 'Contact',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            YMargin(10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  onTapStoryHighlight = !onTapStoryHighlight;
                                });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Story Highlights',
                                        style: TextStyle(
                                          fontFamily: 'SFProText',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: darkModeOn
                                              ? AppColors.white
                                              : AppColors.black,
                                        ),
                                      ),
                                      Transform.rotate(
                                        angle: onTapStoryHighlight
                                            ? 1.5708
                                            : 4.71239,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 10,
                                          color: darkModeOn
                                              ? AppColors.white
                                              : AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  YMargin(2),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: onTapStoryHighlight,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        onTapStoryHighlight =
                                            !onTapStoryHighlight;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Keep your favourite stories on your profile',
                                          style: TextStyle(
                                            fontFamily: 'SFProText',
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                            color: darkModeOn
                                                ? AppColors.white
                                                : AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  YMargin(13),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              child: FloatingActionButton(
                                                onPressed: () {},
                                                elevation: 0,
                                                child: Icon(
                                                  Icons.add,
                                                  size: 30,
                                                  color: darkModeOn
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                                backgroundColor: darkModeOn
                                                    ? AppColors.black
                                                    : AppColors.white,
                                                shape: CircleBorder(
                                                    side: BorderSide(
                                                        width: 0.5,
                                                        color: darkModeOn
                                                            ? AppColors.white
                                                            : AppColors.black)),
                                              ),
                                            ),
                                            YMargin(5),
                                            Text(
                                              'New',
                                              style: TextStyle(
                                                fontFamily: 'SFProText',
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: darkModeOn
                                                    ? AppColors.white
                                                    : AppColors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                        XMargin(18),
                                        CircleAvatar(
                                          backgroundColor: darkModeOn
                                              ? AppColors.grey
                                              : AppColors.storyGrey,
                                          radius: 30,
                                        ),
                                        XMargin(18),
                                        CircleAvatar(
                                          backgroundColor: darkModeOn
                                              ? AppColors.grey
                                              : AppColors.storyGrey,
                                          radius: 30,
                                        ),
                                        XMargin(18),
                                        CircleAvatar(
                                          backgroundColor: darkModeOn
                                              ? AppColors.grey
                                              : AppColors.storyGrey,
                                          radius: 30,
                                        ),
                                        XMargin(18),
                                        CircleAvatar(
                                          backgroundColor: darkModeOn
                                              ? AppColors.grey
                                              : AppColors.storyGrey,
                                          radius: 30,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            YMargin(25),
                          ]),
                    ),
                  ],
                ),
              )
            ];
          },
          body: Column(
            children: [
              TabBar(
                indicatorWeight: 1.5,
                indicatorColor: darkModeOn ? AppColors.white : AppColors.black,
                unselectedLabelColor:
                    darkModeOn ? AppColors.darkStoryGrey : AppColors.borderGrey,
                labelColor: darkModeOn ? AppColors.white : AppColors.black,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.grid_on_outlined,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.account_box_outlined,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    EmptyProfilePostsPage(
                        darkModeOn: darkModeOn,
                        darkIconTheme: darkIconTheme,
                        lightIconTheme: lightIconTheme),
                    EmptyProfileTagPage()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
