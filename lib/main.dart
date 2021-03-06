import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_roof/app/models/cart.dart';
import 'package:urban_roof/app/models/catalog.dart';
import 'package:urban_roof/app/pages/buy/sapling_catalog.dart';
import 'package:urban_roof/app/pages/buy/single_item_view.dart';
import 'package:urban_roof/app/pages/buy/vegetable_catalog.dart';
import 'package:urban_roof/app/pages/cart/cart_screen.dart';
import 'package:urban_roof/app/pages/grow.dart';
import 'package:urban_roof/app/pages/growdetails.dart';
import 'package:urban_roof/app/pages/home.dart';
import 'package:urban_roof/app/pages/profile/profile_edit.dart';
import 'package:urban_roof/app/pages/profile/profile_view_page.dart';
import 'package:urban_roof/app/pages/sell/add_items_to_sell.dart';
import 'package:urban_roof/app/pages/sell/all_items.dart';
import 'package:urban_roof/app/pages/todolist.dart';
import 'package:urban_roof/app/pages/detailspage.dart';
import 'app/pages/buy/main_category.dart';
import 'app/pages/buy/seeds_catalog.dart';
import 'app/pages/cart/confirm_order.dart';
import 'app/pages/log_in.dart';
import 'app/pages/notification.dart';
import 'app/pages/sign_up.dart';
//import 'app/pages/checkout.dart';
//import 'app/pages/shop_items.dart';

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
          fontFamily: 'Raleway',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FirstPage(),
          '/signup': (context) => SignupPage(),
          '/home': (context) => HomePage(),
          '/grow': (context) => MyCrops(),
          '/notification': (context) => MyNotif(),
          '/todo': (context) => Todo(),
          '/maincategory': (context) => MainCategory(),
          '/vegetablecatalog': (context) => VegetableCatalog(),
          '/saplingcatalog': (context) => SaplingCatalog(),
          '/seedcatalog': (context) => SeedCatalog(),
          '/cart': (context) => CartScreen(),
          '/confirmaddress': (context) => ConfirmOrder(),
          '/additems': (context) => AddItemsToSell(),
          '/allitems': (context) => AllItems(),
          '/profile': (context) => ProfileViewPage(),
          '/editprofile': (context) => ProfileEdit(),
          '/singleitem': (context) => SingleItemView(),
        },
      ),
    );
  }
}
