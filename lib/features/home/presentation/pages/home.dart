import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/features/activity/presentation/pages/activity_page.dart';
import 'package:instagram_clone/features/authorization/presentation/pages/login_page.dart';
import 'package:instagram_clone/features/authorization/presentation/pages/sign_up_page.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_post_page.dart';
import 'package:instagram_clone/features/message/presentation/pages/message.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/new_post.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_page.dart';
import 'package:instagram_clone/features/reels/presentation/pages/reels_page.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int pageIndex = 1;
  PageController _pageController;
  bool shouldScrollPage = true;

  @override
  void initState() {
    super.initState();
    shouldScrollPage = true;
    _pageController = new PageController(
      initialPage: pageIndex,
    );
  }

  List<BottomNavigationBarItem> _getBAppBArIcon(int index) {
    var list = [
      BottomNavigationBarItem(
        icon: CustomIcon(
          icon: "home",
          iconAccent: "home_outlined",
          showFirst: index == 0,
          isNotFaded: false,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: CustomIcon(
          icon: "search",
          iconAccent: "search",
          showFirst: index == 1,
          isNotFaded: false,
        ),
        label: 'Like',
      ),
      BottomNavigationBarItem(
        icon: CustomIcon(
          icon: "add",
        ),
        label: 'Discover',
      ),
      BottomNavigationBarItem(
        icon: CustomIcon(
          icon: "liked_filled",
          iconAccent: "like",
          showFirst: index == 3,
          isNotFaded: false,
        ),
        label: 'Like',
      ),
      BottomNavigationBarItem(
        icon: CircleAvatar(
          backgroundColor: Colors.cyan[900],
          radius: 15,
        ),
        label: 'Profile',
      ),
    ];
    return list;
  }

  void addPost() {
    _pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  void gotoHomePost() {
    _pageController.animateToPage(
      1,
      duration: Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  void gotoMessage() {
    _pageController.animateToPage(
      2,
      duration: Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      physics: shouldScrollPage
          ? PageScrollPhysics()
          : NeverScrollableScrollPhysics(),
      pageSnapping: true,
      children: [
        NewPost(),
        Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: IndexedStack(
            index: _selectedIndex,
            children: [
              HomePostPage(
                addPostCallback: addPost,
                gotoMessageCallback: gotoMessage,
              ),
              SearchPage(),
              ReelsPage(),
              ActivityPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            iconSize: 16,
            selectedIconTheme: Theme.of(context).iconTheme,
            unselectedIconTheme: Theme.of(context).iconTheme,
            items: _getBAppBArIcon(_selectedIndex),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;

                if (index != 0) {
                  shouldScrollPage = false;
                } else {
                  shouldScrollPage = true;
                }
              });
            },
          ),
        ),
        Messaging(gotoHomeCallback: gotoHomePost),
      ],
    );
  }
}
