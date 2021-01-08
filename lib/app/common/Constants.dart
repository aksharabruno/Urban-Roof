import 'package:flutter/material.dart';

class Person {
  String name;
  String address;
  String mob;
  int age;
  String username;

  Person({
    @required this.name,
    this.address,
    this.mob,
    this.age,
    this.username,
  });
}

String name;
String address;
String mob;
int age;
String username;

void saveinfo(String n, String a, String m, int ag, String u){
    name = n;
    address = a;
    mob = m;
    age = ag;
    username = u;
  }
