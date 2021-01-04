import 'package:flutter/material.dart';
import 'package:urban_roof/app/models/cart1.dart';
import 'package:urban_roof/app/models/product.dart';
import 'package:urban_roof/app/pages/buy/cart_counter.dart';

class SingleItemView extends StatelessWidget {
  final String type;
  final String image;
  final String title;
  final BuildContext context;
  final double qty;
  final double price;
  final String seller;
  SingleItemView({this.type, this.image, this.title, this.context, this.qty, this.price, this.seller});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset("assets/images/$type$image.jpg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 1.5),
        IconButton(
          padding: EdgeInsets.only(left: 10, top: 30),
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            //padding: EdgeInsets.all(17.0),
            padding: EdgeInsets.only(top:17.0, left: 17.0, right:17.0, bottom: 10.0),
          height:MediaQuery.of(context).size.height/2.6,
          width:MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
             color:Colors.white,
             borderRadius: BorderRadius.only(
              topLeft:Radius.circular(30),
             topRight:Radius.circular(30),),
            
          ),
          child:Column(
            
            children: [
            Expanded(child:Column(
              
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height:30.0),
                Text('$title',
                  style: TextStyle(color: Colors.green, fontSize: 30.0),
                ),
                SizedBox(height:30.0),
                Text(
                  '$qty kg for Rs. $price',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height:18.0),
                Text(
                  'Description: We need a small description here',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                
                SizedBox(height:18.0),
                Text(
                  'Sold by $seller',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                
                Text(
                  'Address: this should be seller address',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                SizedBox(height: 18.0,),
                Row(
                  children: [
                    Text('Qty: ',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    CartCounter(),
                  ]
                )
                
              ],)),
              SizedBox(height: 5.0,),
            Container(
              /*decoration: BoxDecoration(
             color:Colors.white,
             borderRadius: BorderRadius.only(
              topLeft:Radius.circular(10),
             topRight:Radius.circular(10),),
          ),*/
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
            width:MediaQuery.of(context).size.width,
            //color:Colors.green,
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
              
              FlatButton.icon(onPressed: (){
                Product p = new Product(
                  id: 1,
                  images: [
                    "assets/images/vegetabletomato.jpg",
                  ],
                  colors: [
                    Color(0xFFF6625E),
                    Color(0xFF836DB8),
                    Color(0xFFDECB9C),
                    Colors.white,
                  ],
                  title: "Tomato",
                  price: 50,
                  seller: seller,
                  rating: 4.8,
                );
               // Cart(product: p, numOfItem: 2);
                
                
                //Cart.additem(P,2);
                /*Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                  return SingleItemView(type:type, image:image, title:title, context:context, qty:qty, price:price, seller:seller);
              },)*/},
              icon:Icon(Icons.shopping_basket, color:Colors.white,),
              label: Text("Add to cart", style: TextStyle(color: Colors.white, fontSize: 20.0),),
              color:Colors.green,
              shape:StadiumBorder(),)
              /*padding:EdgeInsets.symmetric(
                horizontal:MediaQuery.of(context).size.width/10,
                vertical:10))*/
            ],))
          ],),
          ),
        ),
      ],
    ));
  }
}

