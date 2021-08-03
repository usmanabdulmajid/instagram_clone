import 'package:flutter/material.dart';
import 'package:instagram_clone/features/settings/widget/custom_toggle.dart';

class PostStoriesCommentPage extends StatefulWidget {
  const PostStoriesCommentPage({Key key}) : super(key: key);

  @override
  _PostStoriesCommentPageState createState() => _PostStoriesCommentPageState();
}

class _PostStoriesCommentPageState extends State<PostStoriesCommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Stories CommentPage'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          CustomToggle(
            title: "Likes",
            subtitle: "joshual_ liked your photo.",
            options: ["Off", "From People I follow", "From Everyone"],
            selectedIndex: 1,
          ),
          CustomToggle(
            title: "Likes and Comments on Photo of you",
            subtitle: "joshua_l commented on a post you\'re tagged in.",
            options: ["Off", "From People I follow", "From Everyone"],
            selectedIndex: 1,
          ),
          CustomToggle(
            title: "Photos pf You",
            subtitle: "joshua_l tagged you in a photo.",
            options: ["Off", "From People I follow", "From Everyone"],
            selectedIndex: 2,
          ),
          CustomToggle(
            title: "COMMENTS",
            subtitle: "joshua_l COMMENTED \"Nice shot!\".",
            options: ["Off", "From People I follow", "From Everyone"],
            selectedIndex: 2,
          ),
          CustomToggle(
            title: "Comment Likes and Pins",
            subtitle:
                "joshua_l liked your comment: \"Nice shot!\" and other similar notifications.",
            options: ["Off", "On"],
            selectedIndex: 2,
          ),
          CustomToggle(
            title: "First Post Stories",
            subtitle:
                "See joshua_l\'s first story on Instagram, and other similar notifications.",
            options: ["Off", "From People I follow", "From Everyone"],
            selectedIndex: 2,
          ),
          CustomToggle(
            title: "Additional options in system settings",
            subtitle:
                "These settings may affect any Instagram accounts logged into this devices.",
            options: [],
            selectedIndex: 2,
          ),
        ]),
      ),
    );
  }
}
