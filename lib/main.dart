import 'package:flutter/material.dart';
import 'package:jumbo_electronics/pages/cart.dart';
import 'package:jumbo_electronics/pages/home_page.dart';
import 'package:jumbo_electronics/pages/login_page.dart';
import 'package:jumbo_electronics/pages/products.dart';

import 'package:jumbo_electronics/pages/utils/routes.dart';
import 'package:jumbo_electronics/pages/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
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
    ); // MaterialApp
  }
}
