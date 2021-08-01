import 'package:flutter/material.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/new_live_page.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/new_post_page.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/new_reels_page.dart';
import 'package:instagram_clone/features/new_post/presentation/pages/new_story_page.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/custom_bottom_navbar.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  int selectedIndex = 1;
  void setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          NewPostPage(),
          NewStoryPage(),
          NewReelsPage(),
          NewLivePage()
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
