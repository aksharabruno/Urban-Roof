import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
//import 'package:urban_roof/app/pages/home.dart';
Widget builddrawerelement(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            
            child: ListView(
              padding: const EdgeInsets.only(left: 5.0),
              children: <Widget>[
                Text(
                  'URBAN ROOF',
                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10.0),
                IconButton(
                  icon: Icon(Icons.person_rounded, size: 70.0, color: Colors.white,),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                  alignment: Alignment(-1.0, 0),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      
                      '$name',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                      textAlign: TextAlign.left,
                    ),
                    
                    IconButton(
                      icon: Icon(Icons.arrow_forward_sharp, color: Colors.white), 
                      onPressed: () {Navigator.pushReplacementNamed(context, '/profile');})
                  ]
                )
                
              ],
            ),
            decoration: BoxDecoration(color: Colors.green[600])
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0),
            title: Text('GROW', style: TextStyle(fontSize: 17.0)),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/grow');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0),
            title: Text('TO DO LIST', style: TextStyle(fontSize: 17.0)),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/todo');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0),
            title: Text('HELP', style: TextStyle(fontSize: 17.0)),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0),
            title: Text('SIGN OUT', style: TextStyle(fontSize: 17.0)),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ]
      )
    );
}

Widget buildContainerBottomNav(IconData icon, String route, BuildContext context, {bool isSelected = false}) {
    return Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.green,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 9,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        height: 50,
        width: 50,
        child: IconButton(
          icon: Icon(icon,
          color: isSelected ? Colors.green[800] : Colors.white, size: 30,
          ), onPressed: () {Navigator.pushReplacementNamed(context, '/$route');}
        ),
        );

}

