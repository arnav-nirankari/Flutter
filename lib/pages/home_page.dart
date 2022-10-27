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
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        title: const Text("Jumbo Electronics"),
        surfaceTintColor: Colors.deepPurple,
      ),
      body: Center(
          child: Container(
        child: const Text("Welcome to Jumbo Electronics"),
      ) // Container
          ), // Center
      drawer: const Drawer(),
    ); // Material;
  }
}
