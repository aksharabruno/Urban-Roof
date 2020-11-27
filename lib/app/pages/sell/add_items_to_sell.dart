import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddItemsToSell extends StatefulWidget{
  @override
  _AddItemsToSell createState() => _AddItemsToSell();

}

class _AddItemsToSell extends State<AddItemsToSell> {
  var name;
  var qty;
  var price;

  final nameCon = new TextEditingController();
  final qtyCon = new TextEditingController();
  final priceCon = new TextEditingController();
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
            onTap: () {},
          ),
          ListTile(
            title: Text('Grow'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Buy'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/maincatalog');
            },
          ),
          ListTile(
            title: Text('Sell'),
            onTap: () {
              Navigator.pop(context);
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
        title: Text('Sell'),
        backgroundColor: Colors.teal[800],
        elevation: 2.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameCon,
                decoration: InputDecoration(
                  hintText: 'Enter the name of the item'
                ),
              ),
              TextField(
                controller: qtyCon,
                decoration: InputDecoration(
                  hintText: 'Enter the quantity'
                ),
              ),
              TextField(
                controller: priceCon,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter the price'
                ),
              ),
              RaisedButton(onPressed: () {
                setState((){
                  name = nameCon.text;
                  qty = qtyCon.text;
                  price = priceCon.text;
                });
                Navigator.pushReplacementNamed(context, '/allitems');
              },
                child: Text('Submit'),
              ),
            ],
          )
        )
      ),
    );
  }
}