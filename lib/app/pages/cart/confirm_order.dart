import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
//import 'package:urban_roof/app/models/cart1.dart';
import 'package:urban_roof/app/pages/buy/single_item_view.dart';
//import '../constants.dart';

class ConfirmOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    Added a = new Added(product: null, numOfItem: null);
    return Scaffold(
      drawer: builddrawerelement(context),
      bottomNavigationBar: Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,//getProportionateScreenWidth(15),
        horizontal: 30//getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,//getProportionateScreenWidth(40),
                  width: 40,//getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.receipt, color: Colors.grey[700], size: 20,),
                  //child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/confirmaddress');
                  }, 
                  child: RaisedButton(
                    
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 40.0,
                      width: 150.0,
                      
                      child: Text('Confirm Order', style: TextStyle(color: Colors.white, fontSize: 20.0),
                              textAlign: TextAlign.center,
                      ),
                    ),
                    
                    color: Colors.green,
                    onPressed: () {}
                  )
                )
                
              ],
            ),
            SizedBox(height: 20,/*getProportionateScreenHeight(20)*/),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "Rs ${a.totalvalue()}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pushReplacementNamed(context, '/cart')
      ), 
      backgroundColor: Colors.green,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "ADDRESS",
            style: TextStyle(color: Colors.white),
          ), 
        ],
      ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              //height: 60.0,
              //color: Colors.grey[200],
              child: 
              Text(
                'Please confirm your address',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 12.0),
              )
            ),
            SizedBox(
              height: 8.0,
              child: Container(color: Colors.green[100],),
            ),
            Container(
              padding: EdgeInsets.only(bottom:10.0, left:12.0, right: 12.0),
              /*decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[900])
              ),*/
              child: Column(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child:FlatButton(
                  child:
                      Text('Change',
                    style: TextStyle(color: Colors.blue, fontSize: 17.0),
                  ),
                  onPressed: () {}
                ),),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Deliver to:',
                  style: TextStyle(color: Colors.black, fontSize: 18.0,),
                ),),
                SizedBox(height:10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Mike Johnson',
                  style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
                ),),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('28/3, North Street, Marthandam, Kanyakumari District',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Phone: 9999999999',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),),
              ],)
            ),
            SizedBox(
              height: 8.0,
              child: Container(color: Colors.green[100],),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children:[
                  Text('Seller Details', style: TextStyle(fontSize: 20.0),),
                  SizedBox(height: 20.0),
                  /*for (Added  p in addedList) {
                    sellerdetails(p.product.title, p.product.type, p.product.seller, p.product.address, p.product.phone),
                  },*/
                  sellerdetails('tomato','vegetable','sample seller', '28/3, north street, \nmtm,','99999999999'),
                  sellerdetails('cucumber','vegetable','sample seller', '28/3, north street, \nmtm,','99999999999'),
                  sellerdetails('spinach','vegetable','sample seller', '28/3, north street, \nmtm,','99999999999'),
                ]
              )
            ),
            SizedBox(
              height: 8.0,
              child: Container(color: Colors.green[100],),
            ),
            
          ]
        ),
      )
    );
  }
}

Container sellerdetails(String item, String type, String seller, String add, String phone){
  return Container(
      color: Colors.white,
      child: Column(children:[
        SizedBox(height:5.0),
        Row(children: [
        SizedBox(
          height: 130,
          width: 100,
          child: Image.asset("assets/images/$type$item.jpg", fit: BoxFit.cover)),
        SizedBox(width: 30.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('$item',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),),
          SizedBox(height: 5.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Sold by: $seller',
              style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
          ),),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Address: $add',
              style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
          ),),
          Align(
            //alignment: Alignment.centerLeft,
            child: Text('Phone: $phone',
              style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
          ),),
          ])
      ],),
      SizedBox(height:5.0)
    
      ])
    );
}

showAlertDialog(BuildContext context){
  Widget continueButton = FlatButton(
    
    child: Icon(Icons.check_circle_outline, color: Colors.green[900],),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Woohoo! Order confirmed!", textAlign: TextAlign.center,),
    actions: [
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    }
  );
}

