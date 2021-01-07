import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name = '', username = '', password = '';
  String address = '', mob = '';
  int age;
  //String final_response ='';
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  final _formkey4 = GlobalKey<FormState>();
  final _formkey5 = GlobalKey<FormState>();
  final _formkey6 = GlobalKey<FormState>();
  
  Future<void> _savingData() async {
    final validation1 = _formkey1.currentState.validate();
    final validation2 = _formkey2.currentState.validate();
    final validation3 = _formkey3.currentState.validate();
    final validation4 = _formkey3.currentState.validate();
    final validation5 = _formkey3.currentState.validate();
    final validation6 = _formkey3.currentState.validate();

    if(!validation1 && !validation2 && !validation3 && !validation4 && !validation5 && !validation6){
      return;
    }
    _formkey1.currentState.save();
    _formkey2.currentState.save();
    _formkey3.currentState.save();
    _formkey4.currentState.save();
    _formkey5.currentState.save();
    _formkey6.currentState.save();
  }

  //final unCon = new TextEditingController();
  //final pwCon = new TextEditingController();
  //final nameCon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                //SizedBox(height:100.0),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Sign Up',
                    style:
                        TextStyle(fontSize: 65.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(240.0, 125.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Builder(
              builder: (context) => Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    key: _formkey1,
                    //controller: nameCon,
                    decoration: InputDecoration(
                        labelText: 'NAME ',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onSaved: (value){
                      name = value;
                    }
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    key: _formkey2,
                    //controller: nameCon,
                    decoration: InputDecoration(
                        labelText: 'ADDRESS ',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onSaved: (value){
                      name = value;
                    }
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    key: _formkey3,
                    //controller: nameCon,
                    decoration: InputDecoration(
                        labelText: 'MOBILE ',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onSaved: (value){
                      name = value;
                    }
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    key: _formkey4,
                    //controller: nameCon,
                    decoration: InputDecoration(
                        labelText: 'AGE ',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onSaved: (value){
                      name = value;
                    }
                  ),
                  SizedBox(height: 10.0),

                  TextFormField(
                    key: _formkey5,
                    //controller: unCon,
                    decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onSaved: (value){
                      name = value;
                    }
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    key: _formkey6,
                    //controller: pwCon,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                    onSaved: (value){
                      name = value;
                    }
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          color: Colors.green,
                          onPressed: () async {
                            //Navigator.of(context).pushNamed('/home');
                            //name = nameCon.text;
                            //username = unCon.text;
                            //password = pwCon.text;
                            _savingData();
                            final url = 'http://10.0.2.15:5000/signup';
                            var data = {'Name': name, 'Address': address, 'Mobile Number': mob, 'Age': age, 'Username': username, 'Password': password};
                            final response = await http.post(url, body: json.encode(data));
                            if(response.statusCode == 200){
                              Navigator.of(context).pushNamed('/home');
                            } else {
                              print('error');
                            }
                            //http.close();
                          },
                          
                          child: Center(                            
                            child: Text(
                              'SIGN UP',
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
                      onTap: () {Navigator.of(context).pushNamed('/');},
                      child: Text(
                      'Go Back',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                  ),
                ],
              )),
            ))
        ])));
  }
}
