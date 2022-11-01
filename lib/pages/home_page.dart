import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jumbo_electronics/pages/widgets/item_widget.dart';

import 'package:flutter/material.dart';
import 'package:jumbo_electronics/pages/widgets/MyDrawer.dart';

import '../models/catalog.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Arnav";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final jsonDecoded = await jsonDecode(catalogJson);
    final prodData = jsonDecoded["products"];
    CatalogModel.items =
        List.from(prodData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final randomList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jumbo Electronics",
        ),
      ),
      body: ListView.builder(
        itemCount: CatalogModel.items.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ItemWidget(
            item: CatalogModel.items[index],
          );
        },
      ),
      // : const Center(child: CircularProgressIndicator()), // Center
      drawer: MyDrawer(),
    ); // Material;
  }
}
