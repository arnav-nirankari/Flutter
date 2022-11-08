import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jumbo_electronics/pages/utils/routes.dart';
import 'package:jumbo_electronics/pages/widgets/HomeGrid.dart';
import 'package:jumbo_electronics/pages/widgets/item_widget.dart';

import 'package:flutter/material.dart';
import 'package:jumbo_electronics/pages/widgets/MyDrawer.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import '../models/catalog.dart';
import 'package:jumbo_electronics/models/cart.dart';

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
    await Future.delayed(const Duration(seconds: 0));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final jsonDecoded = await jsonDecode(catalogJson);
    final prodData = await jsonDecoded["products"];
    CatalogModel.items =
        List.from(prodData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    // final randomList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jumbo Electronics",
        ),
      ),
      floatingActionButton: Badge(
        padding: EdgeInsets.all(8),
        borderSide: BorderSide(color: Colors.deepPurple, width: 0.4),
        badgeColor: Colors.amber,
        badgeContent: Text(
          cart.items.length.toString(),
          textScaleFactor: 1.1,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: Icon(Icons.shopping_cart_outlined),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

      body: HomeGrid(items: CatalogModel.items),
      // body: GridView.builder(
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 16,
      //   ),
      //   itemBuilder: ((context, index) {
      //     final item = CatalogModel.items[index];
      //     return Card(
      //       clipBehavior: Clip.antiAlias,
      //       shape:
      //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //       child: GridTile(
      //           header: Container(
      //               padding: EdgeInsets.all(12),
      //               decoration: const BoxDecoration(
      //                 color: Color.fromARGB(199, 124, 77, 255),
      //               ),
      //               child: Text(
      //                 item.name,
      //                 style: TextStyle(color: Colors.white),
      //               )),
      //           footer: Container(
      //               padding: EdgeInsets.all(12),
      //               decoration: const BoxDecoration(
      //                 color: Colors.black45,
      //               ),
      //               child: Text(
      //                 item.price.toString(),
      //                 style: TextStyle(color: Colors.white),
      //               )),
      //           child: Image.network(
      //             item.image,
      //             fit: BoxFit.contain,
      //           )),
      //     );
      //   }),
      //   itemCount: CatalogModel.items.length,
      // ),

      // ListView.builder(
      //   itemCount: CatalogModel.items.length,
      //   physics: const ScrollPhysics(),
      //   itemBuilder: (BuildContext context, int index) {
      //     return ItemWidget(
      //       item: CatalogModel.items[index],
      //     );
      //   },
      // ),
      // : const Center(child: CircularProgressIndicator()), // Center
      drawer: MyDrawer(),
    ); // Material;
  }
}
