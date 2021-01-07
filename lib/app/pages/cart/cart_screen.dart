import 'package:flutter/material.dart';
//import 'package:urban_roof/app/models/cart1.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  //static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pushReplacementNamed(context, '/maincategory')
      ), 
      backgroundColor: Colors.green,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "YOUR CART",
            style: TextStyle(color: Colors.white),
          ),
          
        ],
      ),
      
    );
  }
}
