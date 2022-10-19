import 'package:flutter/material.dart';
import 'package:flutter_catalog/hame_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    ); // MaterialApp
  }
}
