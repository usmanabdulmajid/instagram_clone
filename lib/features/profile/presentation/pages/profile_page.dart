import 'package:flutter/material.dart';
import 'package:instagram_clone/features/profile/presentation/pages/utils/colors.dart';
import 'package:instagram_clone/features/profile/presentation/pages/utils/sizing.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return Scaffold(
      backgroundColor: darkModeOn ? AppColors.black : AppColors.white,
      body: SafeArea(
        child: Container(
          width: Sizing.xMargin(context, 100),
          height: Sizing.yMargin(context, 100),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Story Highlights',
                        style: TextStyle(
                          fontFamily: 'SFProText',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: darkModeOn ? AppColors.white : AppColors.black,
                        ),
                      ),
                      Transform.rotate(
                        angle: 1.5708,
                        child: Icon(Icons.arrow_back_ios,
                            color:
                                darkModeOn ? AppColors.white : AppColors.black),
                      ),
                    ],
                  ),
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
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
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
