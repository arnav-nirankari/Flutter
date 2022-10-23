import 'package:flutter/material.dart';
import 'package:jumbo_electronics/pages/hame_page.dart';
import 'package:jumbo_electronics/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        "/": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    ); // MaterialApp
  }
}
