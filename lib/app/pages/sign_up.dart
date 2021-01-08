import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:urban_roof/app/common/constants.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name = '', username = '', password = '';
  String address = '', mob = '';
  int age;

  final nameCon = new TextEditingController();
  final addCon = new TextEditingController();
  final mobCon = new TextEditingController();
  final ageCon = new TextEditingController();
  final unCon = new TextEditingController();
  final pwCon = new TextEditingController();

  //String final_response ='';
  final _formkey = GlobalKey<FormState>();
  
   
  Future<void> _savingData() async {
    print("hi!");
    final validation = _formkey.currentState.validate();

    if(!validation){
      return;
    }
    _formkey.currentState.save();
  }

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
                key: _formkey,
                children: <Widget>[
                  TextFormField(
                    
                    controller: nameCon,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'NAME ',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                        
                    /*onSaved: (value){
                      name = value;
                    }*/
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    
                    controller: addCon,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'ADDRESS ',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    /*onSaved: (value){
                      name = value;
                    }*/
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: mobCon,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'MOBILE ',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    /*onSaved: (value){
                      name = value;
                    }*/
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    
                    controller: ageCon,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'AGE ',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                   /* onSaved: (value){
                      name = value;
                    }*/
                  ),
                  SizedBox(height: 10.0),

                  TextFormField(
                    
                    controller: unCon,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                   /* onSaved: (value){
                      name = value;
                    }*/
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                   
                    controller: pwCon,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                    /*onSaved: (value){
                      name = value;
                    }*/
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
                            setState(() {
                              name = nameCon.text;
                              address = addCon.text;
                              mob = mobCon.text;
                              age = int.parse(ageCon.text);
                              username = unCon.text; 
                              password = pwCon.text;
                              
                            });
                            print('hi');
                            _savingData();
                            //Person P = new Person(name:name, address:address, mob:mob, age:age, username:username);
                            saveinfo(name,address,mob,age,username);
                            //final url = 'http://10.0.2.2:5000/signup';
                            //var data = {'Name': name, 'Address': address, 'Mobile Number': mob, 'Age': age, 'Username': username, 'Password': password};
                            //print(data);
                            /*var response = await http.post('http://192.168.0.1:5000/signup', headers: {"content-type": "application/json"},
                            body: json.encode({"Name": name, "Address": address, "Mobile Number": mob, "Age": age, "Username": username, "Password": password}));
                            //final response = await http.post(url, body: json.encode({'Name': 'adi'}));
                            print('hey');
                            print(response);
                            Navigator.of(context).pushNamed('/home');
                            if(response.statusCode == 200){
                              Navigator.of(context).pushNamed('/home');
                            } else {
                              print('error');
                            }*/
                            Navigator.pushReplacementNamed(context,'/home');
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

