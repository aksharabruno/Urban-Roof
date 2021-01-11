import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
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
                    buildContainerBottomNav(Icons.notifications_on_rounded, '', context),
                    buildContainerBottomNav(Icons.home, 'home', context),
                    buildContainerBottomNav(Icons.person, '', context, isSelected: true),
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
                          SizedBox(height: 130.0,),
                          CircleAvatar(
                            radius: 73.0,
                            backgroundColor: Colors.green[100],
                            child: Text(
                              'MI',
                      //'${profile.name.substring(0,2).toUpperCase()}',
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
                        'Mike Johnson',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.green[800],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      /*Card(
                        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Bio',
                                    //  'Bio\n${profile.desc}'
                                    )
                                  ],
                                ),
                              )
                            ]
                          ),
                        ),
                      ),*/
                      SizedBox(height:30.0),
                      Container(
                        width: 400.0,
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.grey))
                        ),
                        child: Column(
                          children: [
                            SizedBox(height:30.0),
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
                            Text(
                              'Mob/Phone: +91 8888888888',
                              //'Mob/Phone: ${profile.number}',
                              style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Email: sample@sample.com',
                              //'Email ID: ${profile.eid}',
                              style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Address: Sample address',
                              //'Address: ${profile.address}',
                              style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20.0),
                            RaisedButton(
                              padding: const EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                              ),
                              color: Colors.white,
                              child: Container(
                                
                                width: 100.0,
                                child:Text(                                
                                'SIGN OUT',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15.0,
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
