import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Arnav";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jumbo Electronics"),
      ),
      body: Center(
          child: Container(
        child: Text("Welcome to Jumbo Electronics"),
      ) // Container
          ), // Center
      drawer: Drawer(),
    ); // Material;
  }
}
