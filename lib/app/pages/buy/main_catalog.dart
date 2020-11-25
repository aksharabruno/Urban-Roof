import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/constants.dart';

class MainCatalog extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Catalog'),
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

  String choiceAction(String choice){
    if(choice == Constants.Buy){
      return null;
    } else if(choice == Constants.Sell){
      return '/additemstosell';
    }
    return null;
  }
}
