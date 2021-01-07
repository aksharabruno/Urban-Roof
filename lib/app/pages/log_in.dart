import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String username = "";
  String password = "";
  //String final_response = "";
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();

  //final unCon = new TextEditingController();
  //final pwCon = new TextEditingController();

  Future<void> _savingData() async {
    final validation1 = _formkey1.currentState.validate();
    final validation2 = _formkey2.currentState.validate();
    if(!validation1 && !validation2){
      return;
    }
    _formkey1.currentState.save();
    _formkey2.currentState.save();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //SizedBox(height:50.0),
            Container(
              child: Stack(
                children: <Widget>[
                  
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Welcome to',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Urban Roof',
                        style: TextStyle(
                            fontSize: 65.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  ),
                ],
              ),
            ),
            SizedBox(height:50.0),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  
                  children: <Widget>[
                    TextFormField(
                      key: _formkey1,
                     // controller: unCon,
                      decoration: InputDecoration(
                          labelText: 'USERNAME',
                          labelStyle: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      onSaved: (value){username = value;},
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      key: _formkey2,
                      //controller: pwCon,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                      onSaved: (value){password = value;},
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,                      
                      child: Material(
                        borderRadius: BorderRadius.circular(50.0),
                        shadowColor: Colors.greenAccent,                        
                        elevation: 7.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          color: Colors.green,
                          onPressed: () async {
                            //username = unCon.text;
                            //password = pwCon.text;
                            _savingData();
                            final url = 'http://10.0.2.15:5000/login';
                            var data = {'username': username, 'password': password};
                            final response = await http.post(url, body: json.encode(data));
                            if(response.statusCode == 200){
                                Navigator.of(context).pushNamed('/home');} else {
                                  print('error');
                                }
                          },
                          child: Center(
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
              
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to Urban Roof ?',
                  style: TextStyle(fontFamily: 'Raleway'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register here',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
