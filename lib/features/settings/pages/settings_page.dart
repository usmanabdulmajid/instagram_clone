import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_page.dart';
import 'package:instagram_clone/features/settings/pages/ThemeSettings.dart';
import 'package:instagram_clone/features/settings/pages/about.dart';
import 'package:instagram_clone/features/settings/pages/account_settings.dart';
import 'package:instagram_clone/features/settings/pages/help.dart';
import 'package:instagram_clone/features/settings/pages/privacy/privacy_page.dart';

import 'Notifications/notification_page.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kmediumSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: kmediumSpace * 2.5,
                // margin: EdgeInsets.symmetric(horizontal: kmediumSpace),
                padding: EdgeInsets.symmetric(horizontal: kmediumSpace),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ksmallSpace + 4),
                  color: Theme.of(context).accentColor,
                ),
                child: TextField(
                  cursorWidth: 1,
                  cursorColor: Colors.white,
                  toolbarOptions: ToolbarOptions(
                    copy: true,
                    paste: true,
                    selectAll: true,
                    cut: true,
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Search ",
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context)
                          .unselectedWidgetColor
                          .withOpacity(0.4),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context)
                          .unselectedWidgetColor
                          .withOpacity(0.4),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                ),
              ),
              YMargin(kmediumSpace),
              Tile(
                label: "Follow and Invite Friends",
                onTap: () {},
                leadingWidget: Icon(
                  Icons.person_add_outlined,
                ),
              ),
              Tile(
                label: "Notifications",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationPage()));
                },
                leadingWidget: Icon(
                  Icons.notifications_outlined,
                ),
              ),
              Tile(
                label: "Privacy",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PrivacyPage()));
                },
                leadingWidget: Icon(Icons.lock_outline),
              ),
              Tile(
                label: "Security",
                onTap: () {},
                leadingWidget: Icon(
                  Icons.security_outlined,
                ),
              ),
              Tile(
                label: "Ads",
                onTap: () {},
                leadingWidget: Icon(
                  Icons.speaker,
                ),
              ),
              Tile(
                label: "Account",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AccountSettingsPage()));
                },
                leadingWidget: Icon(
                  Icons.account_circle_outlined,
                ),
              ),
              Tile(
                label: "Help",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HelpPage()));
                },
                leadingWidget: Icon(
                  Icons.help,
                ),
              ),
              Tile(
                label: "About",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
                leadingWidget: Icon(
                  Icons.ac_unit,
                ),
              ),
              Tile(
                label: "Theme",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ThemeSettings()));
                },
                leadingWidget: Icon(
                  Icons.palette_outlined,
                ),
              ),
              YMargin(kmediumSpace),
              Row(
                children: [
                  Text("FACEBOOK"),
                ],
              ),
              YMargin(kmediumSpace),
              Text(
                "Account Center",
                style: Theme.of(context).textTheme.headline6,
              ),
              YMargin(kmediumSpace),
              Text(
                "Control settings for connected experience across Instagram, the Facebook app and Messenger, including story and post sharring and logging in.",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 14),
              ),
              YMargin(kmediumSpace * 2),
              Text("Logins"),
              YMargin(kmediumSpace * 2),
              Text(
                "Add Account",
                style: Theme.of(context).textTheme.headline6,
              ),
              YMargin(kmediumSpace),
              Text(
                "Log Out",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
