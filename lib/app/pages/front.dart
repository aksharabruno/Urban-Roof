import 'package:flutter/material.dart';

class Front extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background3.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), 
      BlendMode.dstATop)
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Hi!',
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Text(
                'Welcome to Urban Roof',
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48.0),
              RaisedButton(
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 20.0),
                ),
                textColor: Colors.white,
                color: Colors.teal[800],
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/maincatalog');
                })
            ],)
        ),
      ),
    );
  }


  // ignore: missing_return
  
}