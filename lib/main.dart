import 'package:flutter/material.dart';
import 'package:jumbo_electronics/pages/home_page.dart';
import 'package:jumbo_electronics/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumbo_electronics/pages/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/login",
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    ); // MaterialApp
  }
}
