import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/features/home/presentation/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //cameras = await availableCameras();

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

ThemeData lightTheme = ThemeData(
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
    headline6: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.normal,
        color: Colors.blueAccent),
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
);

ThemeData darkTheme = ThemeData(
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
    headline6: TextStyle(
        fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.blueAccent),
    caption: TextStyle(
      fontSize: 10.0,
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
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: Home(),
    );
  }
}
