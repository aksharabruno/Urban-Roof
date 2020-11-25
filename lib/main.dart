import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_roof/app/models/cart.dart';
import 'package:urban_roof/app/models/catalog.dart';
import 'package:urban_roof/app/pages/vegetable_catalog.dart';
import 'package:urban_roof/app/pages/main_catalog.dart';
import 'package:urban_roof/app/pages/front.dart';
import 'package:urban_roof/app/pages/cart.dart';
import 'package:urban_roof/app/sell/add_items_to_sell.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Urban Roof',
        theme: ThemeData(
          accentColor: Colors.teal[800],
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Front(),
          '/maincatalog': (context) => MainCatalog(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
          '/sell': (context) => AddItemsToSell(),
        },
      ),
    );
  }
}