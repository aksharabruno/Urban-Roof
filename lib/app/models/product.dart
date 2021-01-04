import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, seller, address;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final int phone;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    @required this.title,
    @required this.price,
    @required this.seller,
    @required this.address,
    @required this.phone
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
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
  ),
  Product(
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
    price: 50,
    seller: seller,
    rating: 4.1,
    phone: 9999999999,
    address: 'so n so n so n so address',
  ),
  Product(
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
    price: 50,
    seller: seller,
    rating: 4.1,
    phone: 9999999999,
    address: 'so n so n so n so address',
  ),
  Product(
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
    price: 50,
    seller: seller,
    rating: 4.1,
    phone: 9999999999,
    address: 'so n so n so n so address',
  ),
  
];

const String seller =
    "Veggies";
