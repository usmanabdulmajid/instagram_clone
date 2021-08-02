import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/home/presentation/widgets/video_post.dart';
import 'package:instagram_clone/features/message/presentation/pages/chats_page.dart';
import 'package:instagram_clone/features/message/presentation/pages/new_messages.dart';
import 'package:instagram_clone/features/message/presentation/pages/rooms_page.dart';
import 'package:instagram_clone/features/message/presentation/pages/video_chat_page.dart';
import 'package:instagram_clone/features/message/presentation/widgets/account_modal_sheet.dart';
import 'package:instagram_clone/features/message/presentation/widgets/suggestionTile.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key key, @required this.gotoHomeCallback}) : super(key: key);
  final VoidCallback gotoHomeCallback;
  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> with TickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _tab = [
    Tab(
      child: Container(
        child: Text(
          'Chats',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Text(
          'Rooms',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  ];
  @override
  void initState() {
    _tabController =
        TabController(initialIndex: 0, length: _tab.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const NewMessages(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Route _createRoute2() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const VideoChatPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: widget.gotoHomeCallback, child: Icon(Icons.arrow_back)),
        title: GestureDetector(
            onTap: () async {
              await buildChangeAccountModal(context);
            },
            child: Row(
              children: [
                Text(
                  "joshua_l",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Transform.rotate(
                    angle: 1.5708, child: Icon(Icons.chevron_right)),
              ],
            )
            //  Text(
            //     "New Video Chat",
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            ),
        bottom: PreferredSize(
          child: TabBar(
            tabs: _tab,
            controller: _tabController,
            isScrollable: false,
            indicatorColor: Theme.of(context).indicatorColor,
            indicator: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(color: Theme.of(context).unselectedWidgetColor),
              ),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1,
          ),
          preferredSize: Size(
            Sizing.xMargin(context, 100),
            Sizing.yMargin(context, 7),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () => Navigator.of(context).push(
                    _createRoute2(),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.photo_camera_front,
                ),
              )),
          GestureDetector(
              onTap: () => Navigator.of(context).push(
                    _createRoute(),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.note_add),
              )),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ChatPage(),
          RoomPage(),
        ],
      ),
    );
  }
}
