import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/modal_list_tile.dart';

import 'notification_page.dart';

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
                padding: EdgeInsets.symmetric(horizontal: kmediumSpace - 4),
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
              ModalListTile(
                label: "Follow and Invite Friends",
                onTap: () {},
                leadingWidget: Icon(
                  Icons.person_add_outlined,
                ),
              ),
              ModalListTile(
                label: "Notifications",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationPage()));
                },
                leadingWidget: Icon(
                  Icons.notifications_outlined,
                ),
              ),
              ModalListTile(
                label: "Privacy",
                onTap: () {},
                leadingWidget: Icon(Icons.lock_outline),
              ),
              ModalListTile(
                label: "Security",
                onTap: () {},
                leadingWidget: Icon(
                  Icons.security_outlined,
                ),
              ),
              ModalListTile(
                label: "Ads",
                onTap: () {},
                leadingWidget: Icon(
                  Icons.speaker,
                ),
              ),
              ModalListTile(
                label: "Account",
                onTap: () {},
                leadingWidget: Icon(
                  Icons.account_circle_outlined,
                ),
              ),
              ModalListTile(
                label: "Help",
                onTap: () {},
                leadingWidget: Icon(
                  Icons.help,
                ),
              ),
              ModalListTile(
                label: "About",
                onTap: () {},
                leadingWidget: Icon(
                  Icons.ac_unit,
                ),
              ),
              ModalListTile(
                label: "Theme",
                onTap: () {},
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
