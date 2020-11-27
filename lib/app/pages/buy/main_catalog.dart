import 'package:flutter/material.dart';

class MainCatalog extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Hope you\'re having a good day'),
            decoration: BoxDecoration(color: Colors.green),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/maincatalog');
            },
          ),
          ListTile(
            title: Text('Grow'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Buy'),
            onTap: () {
              Navigator.pop(context);
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
        title: Text('Main Catalog'),
        backgroundColor: Colors.teal[800],
        elevation: 2.0,
      ),
      body: Padding(
              padding: EdgeInsets.all(30.0), //padding
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  Text(
                    'What would you like to buy?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 48.0),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/catalog');
                    },
                    color: Theme.of(context).accentColor,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      Text(
                        'Vegetables',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                    },
                    color: Theme.of(context).accentColor,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      Text(
                        'Saplings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Theme.of(context).accentColor,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      Text(
                        'Seeds',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    ),
                  ),
  
                  SizedBox(height: 8.0),
                ],
              ) 
            )
    );
  }
}
