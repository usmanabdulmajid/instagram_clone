import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_accounts_page.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_places_page.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_tags_page.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_top_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  final List<String> searchResults = [];
  final String query = '';
  ScrollController _controller;
  int _selectedIndex;
  TabController _tabController;
  String _searchSuffix = "";
  TextEditingController _searchBoxController;
  bool _dissmissBarrier = false;
  var result;
  List<String> _listOfSuffix = [
    "",
    "accounts",
    "tags",
    "places",
  ];

  List<Widget> _tab = [
    Tab(
      child: Container(
        child: Text(
          'Top',
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Text(
          'Accounts',
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Text(
          'Tags',
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Text(
          'Places',
        ),
      ),
    ),
  ];
  @override
  void initState() {
    _controller = ScrollController();
    _tabController = TabController(
      length: _tab.length,
      initialIndex: 0,
      vsync: this,
    );
    _searchBoxController = TextEditingController();
    _selectedIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    _searchBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _selectedIndex,
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ksmallSpace, horizontal: kmediumSpace),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(ksmallSpace)),
                    color: Theme.of(context)
                        .unselectedWidgetColor
                        .withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomIcon(icon: "search", size: 18),
                      XMargin(kmediumSpace),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Search",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).unselectedWidgetColor,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: Sizing.xMargin(context, 33.333),
                mainAxisExtent: Sizing.xMargin(context, 33.333),
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ClipRRect(
                    child: GestureDetector(
                      onLongPressStart: (details) {
                        showDialog(
                          useSafeArea: false,
                          context: context,
                          builder: (ctx) {
                            return Focus(
                              autofocus: true,
                              canRequestFocus: true,
                              child: Listener(
                                behavior: HitTestBehavior.translucent,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 7.0, sigmaY: 7.0),
                                  child: Center(
                                    child: Container(
                                      height: Sizing.yMargin(context, 50),
                                      width: Sizing.xMargin(context, 95),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Theme.of(context).accentColor,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(20)),
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.all(kmediumSpace),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor:
                                                        Colors.cyan[900],
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              child: Container(
                                            color: Theme.of(context)
                                                .unselectedWidgetColor,
                                          )),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(20)),
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: kmediumSpace,
                                                      horizontal:
                                                          kmediumSpace * 2),
                                              child: Row(
                                                children: [
                                                  CustomIcon(
                                                      icon: "like", size: 24),
                                                  Spacer(),
                                                  Icon(
                                                    Icons
                                                        .account_circle_outlined,
                                                    size: 24,
                                                  ),
                                                  Spacer(),
                                                  CustomIcon(
                                                      icon: "messenger",
                                                      size: 24),
                                                  Spacer(),
                                                  Icon(Icons.more_vert_rounded),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.blue[100 * (index % 9)],
                        child: Stack(children: [
                          Text('Post item $index'),
                        ]),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 4.0,
              pinned: true,
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Icon(Icons.arrow_back),
              ),
              title: Container(
                padding: EdgeInsets.symmetric(
                    vertical: ksmallSpace, horizontal: kmediumSpace),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(ksmallSpace)),
                  color:
                      Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Search $_searchSuffix",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                      ),
                    ),
                  ],
                ),
                // TODO(#1608): Add a search texteditor.
                // child: Container(
                //   decoration: BoxDecoration(
                //     borderRadius:
                //         BorderRadius.all(Radius.circular(ksmallSpace)),
                //     color: Theme.of(context)
                //         .unselectedWidgetColor
                //         .withOpacity(0.2),
                //   ),
                //   child: TextField(
                //     controller: _searchBoxController,
                //     cursorWidth: 1,
                //     cursorColor: Colors.white,
                //     toolbarOptions: ToolbarOptions(
                //       copy: true,
                //       paste: true,
                //       selectAll: true,
                //       cut: true,
                //     ),
                //     maxLines: 1,
                //     decoration: InputDecoration(
                //       hintText: "Search $_searchSuffix",
                //       labelStyle: Theme.of(context).textTheme.bodyText1,
                //       border: InputBorder.none,
                //       alignLabelWithHint: true,
                //       suffixIcon: Icon(
                //         Icons.close,
                //         color: Theme.of(context).iconTheme.color,
                //       ),
                //     ),
                //     cursorHeight: 18,
                //   ),
                // ),
              ),
              bottom: PreferredSize(
                child: TabBar(
                  tabs: _tab,
                  controller: _tabController,
                  indicatorColor: Theme.of(context).indicatorColor,
                  onTap: (index) {
                    setState(() {
                      _searchSuffix = _listOfSuffix[index];
                    });
                  },
                ),
                preferredSize: Size(
                  Sizing.xMargin(context, 100),
                  Sizing.yMargin(context, 7),
                ),
              ),
            ),
            SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: true,
              child: TabBarView(
                controller: _tabController,
                children: [
                  SearchTop(),
                  SearchAccount(),
                  SearchTags(),
                  SearchPlaces(),
                ],
              ),
            )
          ],
        )
      ],
<<<<<<< HEAD
=======
    return Container(
      child: Center(
        child: Text('SearchPage'),
      ),
>>>>>>> 9fca54f5bbeaa52993357fe4148fa166b29fe1dd
    );
  }
}
