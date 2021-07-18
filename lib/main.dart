import 'package:flutter/material.dart';
import 'package:instagram_clone/features/authorization/presentation/pages/welcome_page.dart';
import 'package:instagram_clone/features/home/presentation/pages/home.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFFFFFFF),
        accentColor: Color(0xFF262626),
        backgroundColor: Color(0xFFFFFFFF),
        bottomAppBarColor: Color(0xFF000000),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 12.0, fontStyle: FontStyle.normal),
          bodyText2: TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal),
          caption: TextStyle(
              fontSize: 10.0,
              fontStyle: FontStyle.normal,
              color: Color(0xFF262626)),
        ),
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF000000),
        canvasColor: Color(0xFF000000),
        backgroundColor: Color(0xFF000000),
        accentColor: Color(0xFFF9F9F9),
        fontFamily: 'SFProText',
        textTheme: TextTheme(
          caption: TextStyle(
            fontSize: 11.0,
            fontStyle: FontStyle.normal,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF000000),
        ),
        bottomAppBarColor: Color(0xFF000000),
      ),
      home: WelcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ), //;;
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
