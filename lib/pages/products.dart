// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jumbo_electronics/models/catalog.dart';
import 'package:jumbo_electronics/pages/widgets/HomeGrid.dart';

class HomeProducts extends StatelessWidget {
  final Item items;
  const HomeProducts({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: ButtonBar(
            buttonPadding: const EdgeInsets.all(0),
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${items.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 29,
                  )),
              ElevatedButton(
                  onPressed: (() {}),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                      minimumSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width * 0.33,
                          MediaQuery.of(context).size.height * 0.068))),
                  child:
                      // const Text(
                      //   "Buy",
                      //   textScaleFactor: 1.39,
                      //   style: TextStyle(fontWeight: FontWeight.w700),
                      // )
                      AddButton(item: items))
            ]),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Hero(
                  tag: Key(items.id.toString()),
                  child: Image.network(
                    items.image,
                    height: MediaQuery.of(context).size.height * 0.50,
                    fit: BoxFit.contain,
                    // alignment: Alignment.center,
                  )),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    items.name,
                    textScaleFactor: 1.8,
                    style: const TextStyle(
                      // fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    items.desc,
                    textScaleFactor: 1.1,
                    style: const TextStyle(
                      // fontSize: 15,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
