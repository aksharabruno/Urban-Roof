import 'package:flutter/material.dart';

class AllItems extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Hope you\'re having a good day!'),
            decoration: BoxDecoration(color: Colors.green),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Grow'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Buy'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/catalog');
            },
          ),
          ListTile(
            title: Text('Sell'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/additemstosell');
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {},
          ),
        ]
      )
    ),
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
