import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/email_sign_up.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/number_sign_up.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var _tablist = <Tab>[
    Tab(
      child: Text('PHONE NUMBER'),
    ),
    Tab(
      child: Text('EMAIL ADDRESS'),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        width: _size.width,
        height: _size.height,
        padding: EdgeInsets.fromLTRB(0.0, _size.height * 0.2, 0.0, 0.0),
        child: Column(
          children: [
            Icon(
              Icons.person,
              size: 100.0,
            ),
            YMargin(10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                tabs: _tablist,
              ),
            ),
            YMargin(20),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    NumberSignUp(),
                    EmailSignUp(),
                  ],
                ),
              ),
            ),
            Divider(
              color: darkModeOn ? Colors.grey.shade700 : Colors.grey,
            ),
            YMargin(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                Text(
                  'Log in.',
                  style: TextStyle(
                    color:
                        darkModeOn ? AppColors.storyGrey : Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
            YMargin(10),
          ],
        ),
      ),
    );
  }
}
