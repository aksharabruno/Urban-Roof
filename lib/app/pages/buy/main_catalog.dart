import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/drawer_element.dart';

class MainCatalog extends StatelessWidget{
  final String usrnm = 'username123';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerElement(),
      appBar: AppBar(
        title: Text('Buy'),
        backgroundColor: Colors.teal[800],
        elevation: 2.0,
        actions: <Widget>[
          Container(
            height: 15.0,
            child: RaisedButton(
              child: Text('All produce'),
              elevation: 2.0,
              color: Colors.teal,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/allitems');
              }
            )
          ) 
        ],
      ),
      body: CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: Text("He'd have you all unravel at the"),
                decoration: myBoxDecoration(),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('Heed not the rabble'),
                
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('Sound of screams but the'),
                
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('Who scream'),
                
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('Revolution is coming...'),
                
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text('Revolution, they...'),
                
              ),
            ],
          ),
        ),
      ],
    )
  );
    
  }
}

BoxDecoration myBoxDecoration(){
  return BoxDecoration(
    border: Border.all(
      color: Colors.teal,
      width: 5.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15.0)
    )
  );
}
