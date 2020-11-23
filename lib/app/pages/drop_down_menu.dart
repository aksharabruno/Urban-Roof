import 'package:flutter/material.dart';

class DropItem {
  const DropItem(this.name,this.icon);
  final String name;
  final Icon icon;
}
class DropdownScreen extends StatefulWidget {
  State createState() =>  DropdownScreenState();
}
class DropdownScreenState extends State<DropdownScreen> {
  DropItem selectedUser;
  List<DropItem> users = <DropItem>[
    const DropItem('Home',Icon(Icons.home,color:  const Color(0xFF167F67),)),
    const DropItem('Profile',Icon(Icons.account_circle,color:  const Color(0xFF167F67),)),
    const DropItem('Grow',Icon(Icons.local_florist,color:  const Color(0xFF167F67),)),
    const DropItem('Buy',Icon(Icons.shopping_cart,color:  const Color(0xFF167F67),)),
    const DropItem('Sell',Icon(Icons.people_alt,color:  const Color(0xFF167F67),)),
    const DropItem('Notification',Icon(Icons.notifications,color:  const Color(0xFF167F67),)),
  ];
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF167F67),
          title: Text(
            'Menu',
            style: TextStyle(color: Colors.white),
          ),
        ),
      body:  Center(
          child:  DropdownButton<DropItem>(
            hint:  Text("Select item"),
            value: selectedUser,
            // ignore: non_constant_identifier_names
            onChanged: (DropItem Value) {
              setState(() {
                selectedUser = Value;
              });
            },
            items: users.map((DropItem user) {
              return  DropdownMenuItem<DropItem>(
                value: user,
                child: Row(
                  children: <Widget>[
                    user.icon,
                    SizedBox(width: 10,),
                    Text(
                      user.name,
                      style:  TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
