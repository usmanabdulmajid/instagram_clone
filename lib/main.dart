import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/features/authorization/presentation/pages/login_help_page.dart';
import 'package:instagram_clone/features/authorization/presentation/pages/login_page.dart';
import 'package:instagram_clone/features/home/presentation/pages/home.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_page.dart';
import 'package:instagram_clone/features/authorization/presentation/pages/sign_up_page.dart';

void main() {
  runApp(MyApp());
  bool isDark =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: isDark ? Colors.black : Colors.white,
      statusBarColor: isDark ? Colors.black : Colors.white,
      systemNavigationBarDividerColor: isDark ? Colors.black : Colors.white,
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFFFFFFF),
        accentColor: Color(0xFFFFFFFF),
        indicatorColor: Color(0xFF262626),
        unselectedWidgetColor: Color(0xFF262626),
        backgroundColor: Color(0xFFFFFFFF),
        bottomAppBarColor: Color(0xFF000000),
        dividerColor: Color(0xFF9F9F9F),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(fontSize: 12.0, fontStyle: FontStyle.normal),
          bodyText2: TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal),
          caption: TextStyle(
            fontSize: 8.0,
            fontStyle: FontStyle.normal,
            color: Color(0xFF262626),
          ),
          overline: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w900,
            color: Color(0xFF000000),
          ),
        ),
        accentIconTheme: IconThemeData(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
        fontFamily: 'SFProText',
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF000000),
        canvasColor: Color(0xFF000000),
        backgroundColor: Color(0xFF000000),
        accentColor: Color(0xFF262626),
        scaffoldBackgroundColor: Colors.black,
        indicatorColor: Color(0xFF262626),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentIconTheme: IconThemeData(
          color: Colors.white,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
        fontFamily: 'SFProText',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(fontSize: 12.0, fontStyle: FontStyle.normal),
          bodyText2: TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal),
          caption: TextStyle(
            fontSize: 8.0,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Color(0xFFFFFFFF),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF000000),
        ),
        bottomAppBarColor: Color(0xFF000000),
      ),
      home: Home(),
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
