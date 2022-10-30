import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      primarySwatch: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
          elevation: 2,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}
