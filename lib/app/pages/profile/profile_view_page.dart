import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'package:urban_roof/app/common/constants.dart';
//import 'package:urban_roof/app/pages/profile/profile_edit.dart';


class ProfileViewPage extends StatelessWidget{

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
                    buildContainerBottomNav(Icons.notifications_on_rounded, 'notification', context),
                    buildContainerBottomNav(Icons.home, 'home', context),
                    buildContainerBottomNav(Icons.person, 'profile', context, isSelected: true),
                    buildContainerBottomNav(Icons.shopping_cart, 'maincategory', context),
                  ],
                ),
              )),
          appBar: AppBar(
            title: Text('PROFILE'),
            centerTitle: true,
            backgroundColor: Colors.green,
            elevation: 2.0,
            actions: <Widget>[
              Container(
                height: 15.0,
                child: IconButton(
                  icon: Icon(Icons.edit), 
                  onPressed: () {Navigator.pushReplacementNamed(context, '/editprofile');}
                )
              ) 
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              
              child: Container(
                    height: 350.0,
                    child: Center(
                      child: Column(                      
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children : [
                          SizedBox(height: 80.0,),
                          CircleAvatar(
                            radius: 73.0,
                            backgroundColor: Colors.green[100],
                            child: Text(
                              '${name.substring(0,2).toUpperCase()}',
                          style: TextStyle(
                            fontSize: 70.0,
                            color: Colors.green,
                            
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        //'${profile.name}',
                        '$username',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.green[800],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      
                      SizedBox(height:5.0),
                      Container(
                        width: 400.0,
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey))
                        ),
                        child: Column(
                          children: [
                            SizedBox(height:15.0),
                            Text(
                              'Contact Details',
                              //'Contact Details',
                              style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.0),
                            ProfileContent(criteria: 'Name',text: '$name'),
                            ProfileContent(criteria:'Age',text: '$age'),
                            ProfileContent(criteria:'Address',text: '$address'),
                            ProfileContent(criteria:'Mob/Phone', text: '$mob',),
                            /*Text(
                              'Name: $name',
                              //'Mob/Phone: ${profile.number}',
                              style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Address: $address',
                              //'Email ID: ${profile.eid}',
                              style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Mob/Phone: $mob',
                              //'Mob/Phone: ${profile.number}',
                              style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),*/
                            SizedBox(height: 15.0),
                            
                            
                            RaisedButton(
                              padding: const EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                              ),
                              color: Colors.white,
                              child: Container(
                                
                                width: 300.0,
                                child:Text(                                
                                'SIGN OUT',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30.0,
                                ),
                                textAlign: TextAlign.center,
                              ),),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/');
                              },
                            )
                          ],
                        ),
                      )
                    ]
                  )
                ),
              )
          ),
        )
      );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    Key key,
    @required this.criteria,
    this.text,
  }) : super(key: key);

  final String criteria;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFFF5F6F9)),
        //shape: RoundedRectangleBorder(borderRadius: ),
        //color: Color(0xFFF5F6F9),
        //onPressed: press,
        child: Row(
          children: [
            Text('$criteria : ', style:TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(width: 20),
            Expanded(child: Text(text, style:TextStyle(fontSize: 18.0))),
            //Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
