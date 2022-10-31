import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jumbo_electronics/pages/widgets/item_widget.dart';

import 'package:flutter/material.dart';
import 'package:jumbo_electronics/pages/widgets/MyDrawer.dart';

import '../models/catalog.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Arnav";
  @override
  Widget build(BuildContext context) {
    final randomList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jumbo Electronics",
        ),
      ),
      body: ListView.builder(
        itemCount: randomList.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ItemWidget(
            item: randomList[index],
          );
        },
      ), // Center
      drawer: MyDrawer(),
    ); // Material;
  }
}
