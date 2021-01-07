import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';

class MyNotif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: builddrawerelement(context),
      bottomNavigationBar: Container(
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 20,
                          spreadRadius: 1)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildContainerBottomNav(Icons.ballot, 'allitems', context),
                    buildContainerBottomNav(Icons.notifications_on_rounded, 'notification', context, isSelected: true),
                    buildContainerBottomNav(Icons.home, 'home', context),
                    buildContainerBottomNav(Icons.person, 'profile', context),
                    buildContainerBottomNav(Icons.shopping_cart, 'maincategory', context),
                  ],
                ),
              )),
        
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 0,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Container(child: Icon(Icons.menu)),
              onPressed: () {},
            );
          }),
          title: Text(
            "NOTIFICATIONS",
          ),
          actions: <Widget>[
            IconButton(
              icon: Container(child: Icon(Icons.search)),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(padding: new EdgeInsets.all(5)),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Padding(padding: new EdgeInsets.all(2)),
                /*Text("Notifications",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    )),*/
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(115.0),
                  alignment: Alignment.center,
                  child: Text("No new notifications",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.5,
                      )),
                ),
              ],
            )
          ],
        ),
    );
  }
}
