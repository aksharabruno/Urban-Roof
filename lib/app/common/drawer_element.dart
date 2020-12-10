import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerElement extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: ListView(
              padding: const EdgeInsets.only(left: 5.0),
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.person_rounded, size: 70.0, color: Colors.white,),
                  onPressed: () {},
                  alignment: Alignment(-1.0, 0),
                ),
                SizedBox(height: 50.0),
                Text(
                  'username',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            decoration: BoxDecoration(color: Colors.green[600])
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0),
            title: Text('Home', style: TextStyle(fontSize: 17.0)),
            onTap: () {},
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0),
            title: Text('Grow', style: TextStyle(fontSize: 17.0)),
            onTap: () {},
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0),
            title: Text('Buy', style: TextStyle(fontSize: 17.0)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0),
            title: Text('Sell', style: TextStyle(fontSize: 17.0)),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/additemstosell');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0),
            title: Text('Notifications', style: TextStyle(fontSize: 17.0)),
            onTap: () {},
          ),
        ]
      )
    );
  }
}
