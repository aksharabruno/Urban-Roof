import 'package:flutter/material.dart';
//this is all item model
class Item {
  final int id;
  final String title, seller, address, qty, type;
  final String images, desc;
  final double price;
  final int phone;

  Item({
    @required this.id,
    @required this.type,
    @required this.images,
    @required this.title,
    @required this.price,
    @required this.desc,
    @required this.seller,
    @required this.address,
    @required this.phone,
    @required this.qty,
  });
}

// Our demo Items

List<Item> allItems = [
  Item(
    id: 1,
    type: 'sapling',
    images: "assets/images/saplingtomato.jpg",
    title: "Tomato",
    price: 50,
    seller: 'abc nursery',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 plant',
    desc: 'fresh and organic',
  ),
  Item(
    id: 2,
    type: 'sapling',
    images: "assets/images/saplingcabbage.jpg",
    title: "Cabbage",
    price: 42,
    seller: 'abc nursery',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 plant',
    desc: 'fresh and organic',
  ),
  Item(
    id: 3,
    type: 'sapling',
    images: "assets/images/saplingbrinjal.jpg",
    title: "Brinjal",
    price: 30,
    seller: 'abc nursery',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 plant',
    desc: 'fresh and organic',
  ),
  Item(
    id: 4,
    type: 'sapling',
    images: "assets/images/saplingchilli.jpg",
    title: "Chilli",
    price: 12,
    seller: 'abc nursery',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 plant',
    desc: 'fresh and organic',
  ),
  Item(
    id: 5,
    type: 'vegetable',
    images: "assets/images/vegetabletomato.jpg",
    title: "Tomato",
    price: 50,
    seller: 'xyz vendor',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 kg',
    desc: 'fresh and organic',
  ),
  Item(
    id: 6,
    type: 'vegetable',
    images: "assets/images/vegetablecucumber.jpg",
    title: "Cucumber",
    price: 42,
    seller: 'xyz vendor',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '0.5 kg',
    desc: 'fresh and organic',
  ),
  Item(
    id: 7,
    type: 'vegetable',
    images: "assets/images/vegetablecarrot.jpg",
    title: "Carrot",
    price: 30,
    seller: 'xyz vendor',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 kg',
    desc: 'fresh and organic',
  ),
  Item(
    id: 8,
    type: 'seed',
    images: "assets/images/seedspinach.jpg",
    title: "Spinach",
    price: 12,
    seller: 'xyz vendor',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '0.25 kg',
    desc: 'fresh and organic',
  ),
  Item(
    id: 9,
    type: 'seed',
    images: "assets/images/seedtomato.jpg",
    title: "Tomato",
    price: 50,
    seller: 'xyz vendor',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 packet(0.25 grams)',
    desc: 'fresh and organic',
  ),
  Item(
    id: 10,
    type: 'seed',
    images: "assets/images/seedladyfinger.jpg",
    title: "Lady Finger",
    price: 42,
    seller: 'xyz vendor',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 packet(0.25 grams)',
    desc: 'fresh and organic',
  ),
  Item(
    id: 11,
    type: 'seed',
    images: "assets/images/seedspinach.jpg",
    title: "Spinach",
    price: 30,
    seller: 'xyz vendor',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 packet(0.25 grams)',
    desc: 'fresh and organic',
  ),
  Item(
    id: 12,
    type: 'seed',
    images: "assets/images/seedlettuce.jpg",
    title: "lettuce",
    price: 12,
    seller: 'xyz vendor',
    phone: 9999999999,
    address: 'so n so n so n so address',
    qty: '1 packet(0.25 grams)',
    desc: 'fresh and organic',
  ),
  
];
