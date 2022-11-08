import 'package:flutter/material.dart';
import 'package:jumbo_electronics/models/cart.dart';
import 'package:jumbo_electronics/pages/cart.dart';
import 'package:jumbo_electronics/pages/home_page.dart';
import 'package:jumbo_electronics/pages/login_page.dart';
import 'package:jumbo_electronics/pages/products.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:jumbo_electronics/pages/utils/routes.dart';
import 'package:jumbo_electronics/pages/widgets/themes.dart';

import 'models/catalog.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // In this app, CatalogModel never changes, so a simple Provider
          // is sufficient.
          Provider(create: (context) => CatalogModel()),
          // CartModel is implemented as a ChangeNotifier, which calls for the use
          // of ChangeNotifierProvider. Moreover, CartModel depends
          // on CatalogModel, so a ProxyProvider is needed.
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.catalog = catalog;
              return cart;
            },
          ),
        ],
        child: MaterialApp(
          builder: (context, child) => ResponsiveWrapper.builder(child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(color: const Color(0xFFF5F5F5))),
          themeMode: ThemeMode.system,
          theme: MyTheme.lightTheme(context),
          debugShowCheckedModeBanner: false,
          darkTheme: MyTheme.darkTheme(context),
          initialRoute: "/home",
          routes: {
            MyRoutes.homeRoute: (context) => HomePage(),
            MyRoutes.loginRoute: (context) => LoginPage(),
            MyRoutes.cartRoute: (context) => UserCart(),
            // MyRoutes.prodRoute: (context) => HomeProducts()
          },
        )); // MaterialApp
  }
}
