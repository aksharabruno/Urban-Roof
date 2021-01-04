import 'package:flutter/material.dart';

import 'Product.dart';


class Cart {
  int index = 0;
  double total = 0;
  final Product product;
  final int numOfItem;

  Cart({@required this.product, @required this.numOfItem});

  double totalvalue(){
    for (Cart p in cartList){
      total += p.product.price * p.numOfItem;
    }
    return total;
  }
}
/* List<Cart> cartList = [
    Cart(product: demoProducts[0], numOfItem: 2),
  ];
// Demo data for our cart*/

List<Cart> cartList = [
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[3], numOfItem: 1),
];
