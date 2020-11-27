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
            child: Text('Drawer Header'),
            decoration: BoxDecoration(color: Colors.green),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/maincatalog');
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {},
          ),
        ]
      )
    ),
    appBar: AppBar(
      title: Text('All Items'),
      backgroundColor: Colors.teal[800],
      elevation: 2.0,
    ),
  );
  }
}