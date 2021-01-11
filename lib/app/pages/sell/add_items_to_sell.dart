import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';

class AddItemsToSell extends StatefulWidget {
  @override
  _AddItemsToSell createState() => _AddItemsToSell();
}

class _AddItemsToSell extends State<AddItemsToSell> {
  String name = '';
  int qty;
  var price;
  String cat = '';
  String uname = '';
  //user's response will be assigned to this variable
  String final_response = "";

  final nameCon = new TextEditingController();
  final qtyCon = new TextEditingController();
  final priceCon = new TextEditingController();
  final catCon = new TextEditingController();
  final unCon = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Future<void> _savingData() async {
    var validation = _formkey.currentState.validate();
    if (!validation) {
      return;
    }
    _formkey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: builddrawerelement(context),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/allitems')),
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
                      color: Colors.grey[300], blurRadius: 20, spreadRadius: 1)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainerBottomNav(Icons.ballot, 'allitems', context,
                    isSelected: true),
                //buildContainerBottomNav(Icons.notifications_on_rounded, 'notification', context),
                buildContainerBottomNav(Icons.home, 'home', context),
                buildContainerBottomNav(Icons.person, 'profile', context),
                buildContainerBottomNav(
                    Icons.shopping_cart, 'maincategory', context),
              ],
            ),
          )),
      body: Form(
        child: Container(
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
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Builder(
                    builder: (context) => Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: unCon,
                              autofocus: true,
                              decoration: InputDecoration(
                                  labelText: 'YOUR USERNAME',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              //onSaved: (value) {
                              //   name = value;
                              //},
                            ),
                            TextFormField(
                              controller: catCon,
                              autofocus: true,
                              decoration: InputDecoration(
                                  labelText:
                                      'CATEGORY(Vegtables/Seeds/Saplings)',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              //onSaved: (value) {
                              //   name = value;
                              //},
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: nameCon,
                              autofocus: true,
                              decoration: InputDecoration(
                                  labelText: 'PRODUCT NAME',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              //onSaved: (value) {
                              //   name = value;
                              //},
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: qtyCon,
                              autofocus: true,
                              decoration: InputDecoration(
                                  labelText: 'QUANTITY (in Kg)',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              //onSaved: (value) {
                              //   name = value;
                              //},
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: priceCon,
                              autofocus: true,
                              decoration: InputDecoration(
                                  labelText: 'PRICE (in INR)',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              //onSaved: (value) {
                              //   name = value;
                              //},
                            ),
                            SizedBox(height: 50.0),
                            Container(
                                height: 40.0,
                                color: Colors.white,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.greenAccent,
                                  color: Colors.green,
                                  elevation: 7.0,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    color: Colors.green,
                                    onPressed: () async {
                                      //Navigator.of(context).pushNamed('/home');
                                      setState(() {
                                        cat = catCon.text;
                                        name = nameCon.text;
                                        qty = int.parse(qtyCon.text);
                                        price = priceCon.text;
                                        uname = unCon.text;
                                      });
                                      _savingData();

                                      final url =
                                          'http://10.0.2.2:5000/add_sell';
                                      var data = {
                                        'Category': cat,
                                        'ProName': name,
                                        'Quantity': qty,
                                        'Price': price,
                                        'username': uname,
                                      };

                                      final response = await http.post(url,
                                          headers: {
                                            "content-type": "application/json"
                                          },
                                          body: json.encode({
                                            'Category': cat,
                                            'ProName': name,
                                            'Quantity': qty,
                                            'Price': price,
                                            'UserName': uname,
                                          }));
                                      //response = await http.post(url, body: json.encode(data));
                                      //final response = await http.post(url,body: json.encode(data));
                                      if (response.statusCode == 200) {
                                        showAlertDialog(context);
                                      } else {
                                        print('errorsell');
                                      }

                                      //http.close();
                                    },
                                    child: Center(
                                      child: Text(
                                        'Add Item',
                                        style: TextStyle(
                                            //fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Raleway'),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(height: 10.0),
                            Container(
                                padding: EdgeInsets.only(right: 10.0),
                                alignment: Alignment.centerRight,
                                height: 40.0,
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/');
                                  },
                                )),
                          ],
                        )),
                  )),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 200),
                    Container(
                      child: Form(
                          child: Column(children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter your name: ',
                          ),
                        ),
                      ])),
                    ),

                    FlatButton(
                      onPressed: () async {
                        //validating the form and saving it
                        _savingData();
                        //url to send the post request to
                        final url = 'http://10.0.2.2:5000/add_sell';
                        //sending a post request to the url
                        final response = await http.post(url,
                            body: json.encode({'name': name}));
                      },
                      child: Text('SEND'),
                      color: Colors.blue,
                    ),
                    FlatButton(
                      onPressed: () async {
                        //url to send the get request to
                        final url = 'http://10.0.2.2:5000/add_sell';
                        //getting data from the python server script and assigning it to response
                        final response = await http.get(url);
                        //converting the fetched data from json to key value pair that can be displayed on the screen
                        final decoded =
                            json.decode(response.body) as Map<String, dynamic>;
                        //changing the UI be reassigning the fetched data to final response
                        setState(() {
                          final_response = decoded['name'];
                        });
                      },
                      child: Text('GET'),
                      color: Colors.lightBlue,
                    ),
                    //displays the data on the screen
                    Text(
                      final_response,
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
            ]))),
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
      border: Border.all(
        color: Colors.green[100],
        width: 5.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12.0)));
}

showAlertDialog(BuildContext context) {
  Widget continueButton = FlatButton(
    child: Text(
      'Continue',
      style: TextStyle(fontSize: 18.5),
    ),
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
      });
}
/*class AddItems extends StatefulWidget {
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  String name = ""; //user's response will be assigned to this variable
  String final_response =
      ""; //will be displayed on the screen once we get the data from the server
var _formkey =
      GlobalKey<FormState>();
      Future<void> _savingData() async {
    var validation = _formkey.currentState.validate();
    if (!validation) {
      return;
    }
    _formkey.currentState.save();
  }
  OutlineInputBorder _inputformdeco() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide:
          BorderSide(width: 1.0, color: Colors.blue, style: BorderStyle.solid),
    );
  }*/
