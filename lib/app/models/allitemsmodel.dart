import 'package:flutter/material.dart';
//this is all item model
class Item {
  final int id;
  final String title, seller, address, qty;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final int phone;

  Item({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    @required this.title,
    @required this.price,
    @required this.seller,
    @required this.address,
    @required this.phone,
    @required this.qty,
  });
}

// Our demo Items

List<Item> demoItems = [
  Item(
    id: 1,
    images: [
      "assets/images/vegetabletomato.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Tomato",
    price: 50,
    seller: seller,
    rating: 4.8,
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 kg',
  ),
  Item(
    id: 2,
    images: [
      "assets/images/vegetablecucumber.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Cucumber",
    price: 42,
    seller: seller,
    rating: 4.1,
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '0.5 kg',
  ),
  Item(
    id: 3,
    images: [
      "assets/images/vegetablecarrot.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Carrot",
    price: 30,
    seller: seller,
    rating: 4.1,
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 kg',
  ),
  Item(
    id: 4,
    images: [
      "assets/images/vegetablespinach.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Spinach",
    price: 12,
    seller: seller,
    rating: 4.1,
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '0.25 kg'
  ),
  
];

const String seller =
    "Veggies";
