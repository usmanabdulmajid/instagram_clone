import 'package:flutter/material.dart';
import 'package:instagram_clone/features/activity/presentation/pages/activity_page.dart';
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
    _pageController = new PageController(initialPage: pageIndex);
  }

  var _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.video_collection_rounded,
      ),
      label: 'Discover',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_outline,
      ),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
      ),
      label: 'Profile',
    ),
  ];

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
              HomePostPage(),
              SearchPage(),
              ReelsPage(),
              ActivityPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: _list,
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
        Messaging(),
      ],
    );
  }
}
