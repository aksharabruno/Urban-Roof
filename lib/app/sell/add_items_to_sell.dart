import 'package:flutter/material.dart';

class AddItemsToSell extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell'),
        backgroundColor: Colors.teal[800],
        elevation: 2.0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'This is the place to sell',
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
}