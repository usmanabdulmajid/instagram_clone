import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({Key key}) : super(key: key);

  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
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
      appBar: AppBar(
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
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            child: Column(children: [
              Row(children: [Text("To")]),
              Container(),
            ]),
            preferredSize: Size(
              Sizing.xMargin(context, 100),
              Sizing.yMargin(context, 5),
            ),
          ),
          actions: [Text("Chat")]),
    );
  }
}
