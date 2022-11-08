import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/catalog.dart';

class UserCart extends StatelessWidget {
  const UserCart({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Cart",
          // textScaleFactor: 1.3,
        ),
        elevation: 0,
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Text(
              "Your cart is empty right now",
              textScaleFactor: 1.5,
            ))
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: _CartList(),
                  ),
                ),
                _CartTotal()
              ],
            ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<CartModel>();

    return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 9.0,
                horizontal: 7,
              ),
              child: Card(
                child: ListTile(
                  minVerticalPadding: 10,
                  // minLeadingWidth: MediaQuery.of(context).size.width * 0.19,
                  title: Text(cart.items[index].name),
                  leading: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.19,
                    child: Image.network(
                      cart.items[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  subtitle: Text(cart.items[index].desc),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$${cart.items[index].price}",
                        textScaleFactor: 1.4,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          // color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          cart.remove(cart.items[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
        //  ListTile(
        //   leading: Image.network(cart.items[index].image),
        //   trailing: IconButton(
        // icon: const Icon(Icons.remove_circle_outline),
        // onPressed: () {
        //   cart.remove(cart.items[index]);
        //     },
        //   ),
        //   title: Text(
        //     cart.items[index].name,
        //     style: itemNameStyle,
        //   ),
        // ),
        );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<CartModel>(
                builder: (context, cart, child) => Text(
                      '\$${cart.totalPrice}',
                      textScaleFactor: 2.5,
                      style: const TextStyle(
                          // fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    )),
            ElevatedButton(
                onPressed: (() {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Buying not supported yet.")));
                }),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(
                      MediaQuery.of(context).size.width * 0.37,
                      MediaQuery.of(context).size.height * 0.06)),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                ),
                child: const Text("Checkout", style: TextStyle(fontSize: 17)))
          ],
        ),
      ),
    );
  }
}
