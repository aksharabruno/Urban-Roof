import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/Constants.dart';

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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'What would you like to buy?',
                style: TextStyle(
                  color: Colors.teal[800], 
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              
              SizedBox(height: 8.0),
              RaisedButton(
                child: Image.asset('images/vegetables.png'),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/catalog');
                }
              ),
              SizedBox(height: 8.0),
              Text(
                'Vegetables',
                style: TextStyle(
                  color: Colors.teal[800], 
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Image.asset('images/saplings.jpg'),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/catalog');
                }
              ),
              SizedBox(height: 8.0),
              Text(
                'Saplings',
                style: TextStyle(
                  color: Colors.teal[800], 
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],)
        )
      ),
    );
  }

  String choiceAction(String choice){
    if(choice == Constants.Buy){
      return '/maincatalog';
    }
    return null;
  }
}