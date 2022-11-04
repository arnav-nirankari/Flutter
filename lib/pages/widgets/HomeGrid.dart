// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jumbo_electronics/pages/products.dart';
import 'package:jumbo_electronics/pages/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:jumbo_electronics/models/catalog.dart';

class HomeGrid extends StatelessWidget {
  final List<Item> items;
  const HomeGrid({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.length > 1 &&
                  CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList(items: items))
              else
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Item> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // clipBehavior: Clip.antiAlias,
      // shrinkWrap: true,
      itemBuilder: ((context, index) {
        final catalog = items[index];
        //  print(items.length);
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeProducts(items: catalog)));
          },
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      }),
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(19))),
        child: Row(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: CatalogImage(catalog: catalog)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    catalog.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    catalog.desc,
                    style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 13,
                        color: Color.fromARGB(153, 0, 0, 0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 9.0),
                    child: ButtonBar(
                        buttonPadding: const EdgeInsets.all(0),
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${catalog.price}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          ElevatedButton(
                              onPressed: (() {}),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      const StadiumBorder())),
                              child: const Text("Buy"))
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key, required this.catalog});
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      child: Image.network(
        catalog.image,
        fit: BoxFit.contain,
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Product Catalog",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 43,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          "Trending Products",
          style: TextStyle(
            fontSize: 26.5,
          ),
        ),
        // "Catalog App".text.xl5.bold.color(Colors.deepPurple).make(),
        //"Trending Products".text.xl3.make()
      ],
    );
  }
}
