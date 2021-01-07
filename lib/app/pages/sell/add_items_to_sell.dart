import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
/*import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';*/

class AddItemsToSell extends StatefulWidget{
  @override
  _AddItemsToSell createState() => _AddItemsToSell();

}

class _AddItemsToSell extends State<AddItemsToSell> {
  var name;
  var qty;
  var price;
  var cat;

  final nameCon = new TextEditingController();
  final qtyCon = new TextEditingController();
  final priceCon = new TextEditingController();
  final catCon = new TextEditingController();

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: builddrawerelement(context),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/allitems')
        ),
        title: Text('ADD ITEMS'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 2.0,
        
      ),
      bottomNavigationBar: Container(
              height: 55,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 20,
                          spreadRadius: 1)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildContainerBottomNav(Icons.ballot, 'allitems', context, isSelected: true),
                    buildContainerBottomNav(Icons.notifications_on_rounded, 'notification', context),
                    buildContainerBottomNav(Icons.home, 'home', context),
                    buildContainerBottomNav(Icons.person, 'profile', context),
                    buildContainerBottomNav(Icons.shopping_cart, 'maincategory', context),
                  ],
                ),
              )),
      body: Container(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(10.0),
              decoration: myBoxDecoration(),
              child: Text(
                "Always hoping to promote small businesses like yours! :)",
                style: TextStyle(fontSize: 20.0, color: Colors.green[800]),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'CATEGORY  : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      controller: catCon,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Vegetables/Seeds/Saplings',
                      ),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'NAME  : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  SizedBox(width: 43.0),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      controller: nameCon,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the name of your item',
                      ),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'QUANTITY  : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      controller: qtyCon,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the quantity(eg: 1kg/5gm/1 sapling)',
                      ),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'PRICE (Rs.)  : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  SizedBox(width: 13.0),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      controller: priceCon,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the price',
                      ),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'DESCRIPTION  : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  SizedBox(width: 13.0),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      controller: priceCon,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter small description (optional)',
                      ),
                    ),
                  ),
                ]
              )
            ),
            SizedBox(height: 40.0),
            RaisedButton(
              //onPressed: chooseImage,
              onPressed: () {},
              color: Colors.green[100],
              child: Text('Choose Image', style: TextStyle(fontSize: 15.0),),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.green[100],
                  width: 1.0,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(width: 20.0,),
            //showImage(),
            SizedBox(height: 20.0),
            
            
            SizedBox(height: 20.0),
            /*Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
              ),
            ),*/
            RaisedButton(
              onPressed: () {
                setState((){
                  name = nameCon.text;
                  qty = qtyCon.text;
                  price = priceCon.text;
                  cat = catCon.text;
                });
                showAlertDialog(context);
                },
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.green,
                  width: 1.0,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                'Add item',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.green,
            ),
            
          ],
        )
          )
      
    ));
  }
}

BoxDecoration myBoxDecoration(){
  return BoxDecoration(
    border: Border.all(     
      color: Colors.green[100],
      width: 5.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(12.0)
    )
  );
}

showAlertDialog(BuildContext context){
  Widget continueButton = FlatButton(
    child: Text('Continue', style: TextStyle(fontSize: 18.5),),
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/allitems');
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Yes!"),
    content: Text("Your item has been successfully added"),
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

/*class AddItems extends StatefulWidget {
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {

  String name = ""; //user's response will be assigned to this variable 
  String final_response = ""; //will be displayed on the screen once we get the data from the server
  final _formkey = GlobalKey<FormState>(); //key created to interact with the form

  //function to validate and save user form 
  Future<void> _savingData() async{
    final validation = _formkey.currentState.validate();
    if (!validation){
      return;
    }
    _formkey.currentState.save();
  }

  //function to add border and rounded edges to our form
  OutlineInputBorder _inputformdeco(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide:
          BorderSide(width: 1.0, color: Colors.blue, style: BorderStyle.solid),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            Container(width: 350,
              child: Form(key: _formkey,
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your name: ',
                      enabledBorder: _inputformdeco(),
                      focusedBorder: _inputformdeco(),
                    ),onSaved: (value){
                      name = value; //getting data from the user form and assigning it to name 
                    },
                    ),
              ),
            ),

            FlatButton(
              onPressed: () async {

                //validating the form and saving it
                _savingData();

                //url to send the post request to 
                final url = 'http://127.0.0.1:5000/name';

                //sending a post request to the url
                final response = await http.post(url, body: json.encode({'name' : name}));

              },
              child: Text('SEND'),
              color: Colors.blue,
            ),


            FlatButton(
              onPressed: () async {

                //url to send the get request to 
                final url = 'http://127.0.0.1:5000/name';

                //getting data from the python server script and assigning it to response
                final response = await http.get(url);

                //converting the fetched data from json to key value pair that can be displayed on the screen
                final decoded = json.decode(response.body) as Map<String, dynamic>;

                //changing the UI be reassigning the fetched data to final response
                setState(() {
                  final_response = decoded['name'];
                });

              },
              child: Text('GET'),
              color: Colors.lightBlue,
            ),

            //displays the data on the screen
            Text(final_response, style: TextStyle(fontSize: 24),)
          ],
        ),
      ),
    );
  }
}*/
