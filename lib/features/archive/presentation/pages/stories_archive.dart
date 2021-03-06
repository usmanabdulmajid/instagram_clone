import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/archive/presentation/pages/add_stories_archive.dart';
import 'package:instagram_clone/features/archive/presentation/pages/date_stories_archive.dart';
import 'package:instagram_clone/features/archive/presentation/pages/location_stories_archive.dart';
import 'package:instagram_clone/features/archive/presentation/widgets/archive_bottom_sheet.dart';
import 'package:instagram_clone/features/archive/presentation/widgets/options_bottom_sheet.dart';

class StoriesArchive extends StatefulWidget {
  @override
  _StoriesArchiveState createState() => _StoriesArchiveState();
}

class _StoriesArchiveState extends State<StoriesArchive>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Tab> _tabs = [
    Tab(
      icon: Icon(Icons.rounded_corner),
    ),
    Tab(
      icon: Icon(Icons.calendar_today),
    ),
    Tab(
      icon: Icon(Icons.location_on),
    )
  ];
  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: GestureDetector(
          onTap: () {
            archiveBottomSheet(context);
          },
          child: Row(
            children: [
              Text(
                "Stories archive",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Transform.rotate(
                angle: 1.5708,
                child: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              optionsBottomSheet(context);
            },
            child: Icon(Icons.more_vert),
          )
        ],
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size(
            Sizing.xMargin(context, 100),
            Sizing.yMargin(context, 7),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
              ),
              child: TabBar(
                tabs: _tabs,
                controller: _tabController,
                labelColor: darkModeOn ? Colors.white : Colors.black,
                indicatorColor: darkModeOn ? Colors.white : Colors.black,
                overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.transparent,
                ),
                indicatorWeight: 1,
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AddStoriesArchive(),
          DateStoriesArchive(),
          LocationStoriesArchive(),
        ],
      ),
    );
  }
}
