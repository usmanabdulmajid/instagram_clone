import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/message/presentation/widgets/accout_tile.dart';
import 'package:instagram_clone/features/message/presentation/widgets/suggestionTile.dart';

import '../../../../constants.dart';

class VideoChatPage extends StatefulWidget {
  const VideoChatPage({Key key}) : super(key: key);

  @override
  _VideoChatPageState createState() => _VideoChatPageState();
}

class _VideoChatPageState extends State<VideoChatPage> {
  List _selectedPeople = [];
  TextEditingController _searchBoxController;
  List<Widget> _selectedAccount = [];

  int _tapIndex;
  Map<int, int> _tapIndexes = {};

  @override
  void initState() {
    _searchBoxController = TextEditingController();
    super.initState();
  }

  Route _createRoute() {
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

  void selectAccount(String name, bool shouldAdd) {
    setState(() {
      _tapIndexes.putIfAbsent(_tapIndex, () => _tapIndexes.length ?? 0);
      if (shouldAdd) {
        _selectedAccount.add(AccountTile(name: name));
      } else {
        _selectedAccount.removeAt(_tapIndexes[_tapIndex]);
        _tapIndexes.remove(_tapIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: GestureDetector(
              onTap: () {
                // ignore: unnecessary_statements
                Navigator.of(context).pop(
                  _createRoute(),
                );
              },
              child: Icon(Icons.arrow_back),
            ),
            title: Text(
              "New Video Chat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: ClipOval(
                      child: Container(
                        width: klargeIconSize * 2,
                        height: klargeIconSize * 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            transform: GradientRotation(5.49778715),
                            colors: [
                              Colors.blueAccent,
                              Colors.lightBlueAccent,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Icon(Icons.photo_camera),
                        ),
                      ),
                    ),
                    title: Text("Create Room"),
                    subtitle: Text(
                      "Send a link to video chat with anyone, \neven if they don't have Instagram.",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 13),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Divider(
                    color: Theme.of(context)
                        .unselectedWidgetColor
                        .withOpacity(0.2),
                  ),
                  YMargin(ksmallSpace),
                  Padding(
                    padding: const EdgeInsets.all(kmediumSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invite to Video Chat",
                          textAlign: TextAlign.left,
                        ),
                        YMargin(kmediumSpace),
                        Container(
                          height: kmediumSpace * 3,
                          child: Row(
                            children: [
                              Text("To:"),
                              XMargin(kmediumSpace * 2),
                              ..._selectedAccount,
                              // Container(
                              //     child: ListView(
                              //   scrollDirection: Axis.horizontal,
                              //   children: [
                              //     AccountTile(name: "joshua_l"),
                              //   ],
                              // )),
                              Container(
                                color: Colors.red,
                                // child: TextField(
                                //   controller: _searchBoxController,
                                //   cursorWidth: 1,
                                //   toolbarOptions: ToolbarOptions(
                                //     copy: true,
                                //     paste: true,
                                //     selectAll: true,
                                //     cut: true,
                                //   ),
                                //   maxLines: 1,
                                //   decoration: InputDecoration(
                                //     hintText: "Search",
                                //     labelStyle:
                                //         Theme.of(context).textTheme.bodyText1,
                                //     border: InputBorder.none,
                                //     hintStyle: TextStyle(
                                //       fontSize: 16,
                                //       color: Theme.of(context)
                                //           .unselectedWidgetColor,
                                //     ),
                                //   ),
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     color:
                                //         Theme.of(context).unselectedWidgetColor,
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                        ),
                        YMargin(kmediumSpace),
                        Divider(
                          color: Theme.of(context)
                              .unselectedWidgetColor
                              .withOpacity(0.7),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              preferredSize: Size(
                Sizing.xMargin(context, 100),
                Sizing.yMargin(context, 30),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(ksmallSpace),
                child: Center(
                  child: _selectedPeople.length > 0
                      ? Text(
                          "Start",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                          ),
                        )
                      : SizedBox(),
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, index) {
              return Listener(
                onPointerDown: (e) {
                  setState(() {
                    _tapIndex = index;
                  });
                },
                child: SuggesstionTile(
                  title: "joshua_$index",
                  selector: true,
                  selected: false,
                  onTap: selectAccount,
                ),
              );
            }, childCount: 15),
          ),
        ],
      ),
    );
  }
}