import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urban_roof/app/common/constants.dart';

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
      appBar: AppBar(
        title: Text('Sell'),
        backgroundColor: Colors.teal[800],
        elevation: 2.0,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: 
                    RaisedButton(
                      child: Text(choice),
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, choiceAction(choice));
                      }
                    ),
                );
              }).toList();
            },
          )
        ],
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

  String choiceAction(String choice){
    if(choice == Constants.Buy){
      return '/maincatalog';
    } else if(choice == Constants.Sell){
      return '/additemstosell';
    }
    return null;
  }
}