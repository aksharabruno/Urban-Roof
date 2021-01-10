import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'package:urban_roof/app/common/constants.dart';
//import 'package:urban_roof/app/pages/profile/profile_view_page.dart';


// ignore: must_be_immutable
class ProfileEdit extends StatefulWidget{
  
  @override
  _ProfileEdit createState() => _ProfileEdit();
}

class _ProfileEdit extends State<ProfileEdit>{


  final nameCon = new TextEditingController();
  final numCon = new TextEditingController();
  final addCon = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: builddrawerelement(context),
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
                    buildContainerBottomNav(Icons.ballot, 'allitems', context),
                   // buildContainerBottomNav(Icons.notifications_on_rounded, 'notification', context),
                    buildContainerBottomNav(Icons.home, 'home', context),
                    buildContainerBottomNav(Icons.person, 'profile', context, isSelected: true),
                    buildContainerBottomNav(Icons.shopping_cart, 'maincategory', context),
                  ],
                ),
              )),
      appBar: AppBar(
         leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/profile')
        ), 
        title: Text('EDIT'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 2.0,
      ),
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: Column(children: [
            /*Container(
              height: 150,
              child: ClipRRect(
                borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(500),bottomRight: Radius.circular(500)),
                child: Container(color: Colors.green[300]))),*/
            Container(
            padding: EdgeInsets.all(50.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                            radius: 73.0,
                            backgroundColor: Colors.green[100],
                            child: Text(
                              '${name.substring(0,2).toUpperCase()}',
                          style: TextStyle(
                            fontSize: 70.0,
                            color: Colors.green,)),
              ),),
              SizedBox(height:70.0),
              Text(
                'Mob/Phone',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold, fontSize: 19.0,
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.teal[900]),
                controller: numCon,
                cursorColor: Colors.white10,
                decoration: InputDecoration(
                  hintText: '$mob',
                ),
              ),
              SizedBox(height: 15.0,),
              Text(
                'Address',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold, fontSize: 19.0,
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.teal[900]),
                controller: addCon,
                cursorColor: Colors.white10,
                decoration: InputDecoration(
                  hintText: '$address',
                ),
              ),
              SizedBox(height: 70.0),
              RaisedButton(
                padding: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.green,
                  width: 1.0,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(50),
              ),
                color: Colors.green,
                child: Text(                                
                  'Set Changes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  setState((){
                  name = nameCon.text;
                  mob = numCon.text;
                  address = addCon.text;
                  //Navigator.push(context, new MaterialPageRoute(builder: (context) => ProfileViewPage(profile: new ProfileEdit(name, eid, number, address, desc))));
                });
                showAlertDialog(context);
                },
              
              )
            ]
        ),
      )
        
        ]
    ))
      );
  }
}

showAlertDialog(BuildContext context){
  Widget okButton = FlatButton(
    child: Text('OK', style: TextStyle(fontSize: 18.5),),
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/profile');
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text(" "),
    content: Text("Profile edited successfully!"),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    }
  );
}
