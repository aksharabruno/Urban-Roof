import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/constants.dart';

class AddItemsToSell extends StatelessWidget{
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
      body: Text('Add your items here to sell'),
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