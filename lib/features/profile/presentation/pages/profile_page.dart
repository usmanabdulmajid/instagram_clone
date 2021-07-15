import 'package:flutter/material.dart';
import 'package:instagram_clone/features/profile/presentation/pages/utils/colors.dart';
import 'package:instagram_clone/features/profile/presentation/pages/utils/sizing.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool onTapStoryHighlight = false;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: darkModeOn ? AppColors.black : AppColors.white,
      body: SafeArea(
        child: Container(
          width: Sizing.xMargin(context, 100),
          height: Sizing.yMargin(context, 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'iloveteajay',
                        style: TextStyle(
                          fontFamily: 'SFProText',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: darkModeOn ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.add_box_outlined,
                            size: 30,
                            color:
                                darkModeOn ? AppColors.white : AppColors.black,
                          ),
                        ),
                        XMargin(15),
                        Container(
                          child: Icon(
                            Icons.menu,
                            size: 30,
                            color:
                                darkModeOn ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                YMargin(10),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                    color: darkModeOn ? AppColors.white : AppColors.black,
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
                    color: darkModeOn ? AppColors.white : AppColors.black,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            angle: onTapStoryHighlight ? 1.5708 : 4.71239,
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
                            onTapStoryHighlight = !onTapStoryHighlight;
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                              backgroundColor: AppColors.grey,
                              radius: 30,
                            ),
                            XMargin(18),
                            CircleAvatar(
                              backgroundColor: AppColors.grey,
                              radius: 30,
                            ),
                            XMargin(18),
                            CircleAvatar(
                              backgroundColor: AppColors.grey,
                              radius: 30,
                            ),
                            XMargin(18),
                            CircleAvatar(
                              backgroundColor: AppColors.grey,
                              radius: 30,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                YMargin(25),
                Row(
                  children: [
                    Expanded(
                      child: DefaultTabController(
                        length: 2,
                        child: Stack(
                          fit: StackFit.passthrough,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.grey,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                            TabBar(
                              indicatorWeight: 1.0,
                              unselectedLabelColor: AppColors.darkStoryGrey,
                              labelColor: darkModeOn
                                  ? AppColors.white
                                  : AppColors.black,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    Key key,
    @required this.darkModeOn,
    @required this.label,
  }) : super(key: key);

  final bool darkModeOn;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: darkModeOn ? AppColors.white : AppColors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 32),
        textStyle: TextStyle(
          fontFamily: 'SFProText',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: darkModeOn ? AppColors.white : AppColors.black,
        ),
        primary: darkModeOn ? AppColors.black : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            width: 1.0,
            color: darkModeOn ? AppColors.darkStoryGrey : AppColors.black,
          ),
        ),
      ),
    );
  }
}

class ProfileTextWidget extends StatelessWidget {
  const ProfileTextWidget({
    Key key,
    @required this.darkModeOn,
    @required this.label,
    @required this.labelCount,
  }) : super(key: key);

  final bool darkModeOn;
  final String label;
  final String labelCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          labelCount,
          style: TextStyle(
            fontFamily: 'SFProText',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: darkModeOn ? AppColors.white : AppColors.black,
          ),
        ),
        YMargin(5),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'SFProText',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: darkModeOn ? AppColors.white : AppColors.black,
          ),
        ),
      ],
    );
  }
}
