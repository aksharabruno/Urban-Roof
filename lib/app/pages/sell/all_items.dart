import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/drawer_element.dart';

class AllItems extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: DrawerElement(),
    appBar: AppBar(
      title: Text('All Produce'),
      backgroundColor: Colors.teal[800],
      elevation: 2.0,
      actions: <Widget>[
          RaisedButton(
            child: Text('Add new items'),
            elevation: 2.0,
            color: Colors.teal,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/additemstosell');
            }
          )
        ],
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Here are all of your items to sell',
              style: TextStyle(fontSize: 19.0),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.teal, width: 2.0)),
            padding: const EdgeInsets.all(25.0),
          ),
        ],
      )
      
    ),
  );
  }
}
