import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/message/presentation/widgets/accout_tile.dart';
import 'package:instagram_clone/features/message/presentation/widgets/suggestionTile.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({Key key}) : super(key: key);

  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  List _selectedPeople = [];
  TextEditingController _searchBoxController;
  Map<int, Widget> _selectedAccount = Map<int, Widget>();

  int _tapIndex;

  void selectAccount(String name, bool shouldAdd) {
    setState(() {
      if (shouldAdd) {
        _selectedAccount[_tapIndex] = AccountTile(name: name);
      } else {
        _selectedAccount.remove(_tapIndex);
      }
    });
  }

  @override
  void initState() {
    _searchBoxController = TextEditingController();
    super.initState();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const NewMessages(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset(1.0, 0.0);
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
              "New Message",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.all(kmediumSpace),
                child: Column(children: [
                  Row(children: [Text("To"), XMargin(kmediumSpace)]),
                  Padding(
                    padding: const EdgeInsets.all(ksmallSpace),
                    child: Container(
                      child: TextField(
                        controller: _searchBoxController,
                        cursorWidth: 1,
                        toolbarOptions: ToolbarOptions(
                          copy: true,
                          paste: true,
                          selectAll: true,
                          cut: true,
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "Search",
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).unselectedWidgetColor),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              preferredSize: Size(
                Sizing.xMargin(context, 100),
                Sizing.yMargin(context, 15),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(ksmallSpace),
                child: Center(
                  child: Text(
                    "Chat",
                    style: TextStyle(
                      fontSize: 18,
                      color: _selectedAccount.length > 0
                          ? Colors.blueAccent
                          : Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
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
