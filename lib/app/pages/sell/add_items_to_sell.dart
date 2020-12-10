import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/drawer_element.dart';

class AddItemsToSell extends StatefulWidget{
  @override
  _AddItemsToSell createState() => _AddItemsToSell();

}

class _AddItemsToSell extends State<AddItemsToSell> {
  var name;
  var qty;
  var price;
  var type;

  final nameCon = new TextEditingController();
  final qtyCon = new TextEditingController();
  final priceCon = new TextEditingController();
  final typeCon = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: DrawerElement(),
      appBar: AppBar(
        title: Text('Sell'),
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

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(10.0),
              decoration: myBoxDecoration(),
              child: Text(
                "Always hoping to promote small businesses like yours! Because every one deserves the equal chance :)",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'TYPE  : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      controller: typeCon,
                      decoration: InputDecoration(
                        hintText: 'Vegetables/Seeds/Saplings',
                      ),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'NAME  : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      controller: nameCon,
                      decoration: InputDecoration(
                        hintText: 'Enter the name of your item',
                      ),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'QUANTITY  : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      controller: qtyCon,
                      decoration: InputDecoration(
                        hintText: 'Enter the quantity(eg: 1kg/5gm/1 sapling)',
                      ),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'PRICE  : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      controller: priceCon,
                      decoration: InputDecoration(
                        hintText: 'Enter the price',
                      ),
                    ),
                  ),
                ]
              )
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {
                setState((){
                  name = nameCon.text;
                  qty = qtyCon.text;
                  price = priceCon.text;
                  type = typeCon.text;
                });
                showAlertDialog(context);
                },
              child: Text(
                'Add item',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.teal,
            ),
            
          ],
        )
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

showAlertDialog(BuildContext context){
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/allitems');
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Yes!"),
    content: Text("Produce successfully added"),
    actions: [
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    }
  );
}
