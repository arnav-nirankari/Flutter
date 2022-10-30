import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:jumbo_electronics/pages/widgets/MyDrawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Arnav";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Jumbo Electronics",
          textAlign: TextAlign.center,
        ),
        surfaceTintColor: Colors.deepPurple,
      ),
      body:
          const Center(child: Text("Welcome to Jumbo Electronics") // Container
              ), // Center
      drawer: MyDrawer(),
    ); // Material;
  }
}
