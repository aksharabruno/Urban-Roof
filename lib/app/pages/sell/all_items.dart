import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';

class AllItems extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                    buildContainerBottomNav(Icons.ballot, '', context, isSelected: true),
                    buildContainerBottomNav(Icons.notifications_on_rounded, '', context),
                    buildContainerBottomNav(Icons.home, 'home', context),
                    buildContainerBottomNav(Icons.person, 'profile', context),
                    buildContainerBottomNav(Icons.shopping_cart, 'maincategory', context),
                  ],
                ),
              )),
    appBar: AppBar(
      title: Text('SELL'),
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 2.0,
      actions: <Widget>[
        SizedBox(
          width:55.0,
          child: FlatButton(
            child: Icon(Icons.add, color: Colors.white,),
            //elevation: 2.0,
            color: Colors.green,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/additems');
            }
          )
        )
          
        ],
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal[900])
            ),
            child: Text(
              'Here are all of your items to sell',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            )
          ),
          itemflatbutton('Brinjal', 'saplingbrinjal'),
          itemflatbutton('Cauliflower', 'saplingcauliflower'),
          itemflatbutton('Brinjal', 'vegetablebrinjal'),
          //itemflatbutton('Cabbage', 'saplingecabbage'),
          itemflatbutton('Tomato', 'saplingtomato'),
          itemflatbutton('Spinach', 'vegetablespinach'),
        ],
      )
      
    ),
  );
  }
}

BoxDecoration myBoxDecoration(String image){
  return BoxDecoration(
    color: Colors.white,
    image: DecorationImage(
      image: AssetImage('assets/images/$image.jpg') ,
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(5.0)
    )
  );
}

Widget itemflatbutton(String item, String image) {
  return FlatButton(
            onPressed: () {},
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: DecoratedBox(
                    decoration: myBoxDecoration(image)
                  ),
                ),
                SizedBox(width: 30.0),
                Column(
                  children: [
                    Text(
                      '$item',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      'Rs. 50 per kg',
                      style: TextStyle(fontSize: 17.0),
                    ),

                    Row(
                      children: [
                        Text(
                          ' '
                        )
                      ],
                    )
                  ]
                ),
              ],
            ),
            shape: RoundedRectangleBorder(side: BorderSide(
              color: Colors.grey,
              width: 1.0,
              style: BorderStyle.solid
            ),
          )
          );
}
