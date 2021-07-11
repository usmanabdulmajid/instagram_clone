import 'package:flutter/material.dart';
import 'package:instagram_clone/features/activity/presentation/pages/activity_page.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_post_page.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_page.dart';
import 'package:instagram_clone/features/reels/presentation/pages/reels_page.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

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
        Icons.favorite,
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
    return Scaffold(
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
        items: _list,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
