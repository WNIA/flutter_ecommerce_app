import 'package:flutter/material.dart';
import 'package:flutter_training_2/pages/cart_page.dart';
import 'package:flutter_training_2/pages/home_page.dart';
import 'package:flutter_training_2/pages/new_product_page.dart';
import 'package:flutter_training_2/pages/product_details_page.dart';
import 'package:flutter_training_2/provider/cart_provider.dart';
import 'package:flutter_training_2/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          NewProductPage.routeName: (context) => NewProductPage(),
          ProductDetailsPage.routeName: (context) => ProductDetailsPage(),
          CartPage.routeName: (context) => CartPage()
        },
      ),
    );
  }
}
