import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'package:urban_roof/app/models/cart1.dart';

import '../constants.dart';

class ConfirmAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: builddrawerelement(context),
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
            "CONFIRM ADDRESS",
            style: TextStyle(color: Colors.white),
          ), 
        ],
      ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              child: Text(
                'Please confirm your address',
                style: TextStyle(color: Colors.black54, fontSize: 13.0),
              )
            ),
            Container(
              child: Column(children: [
                FlatButton(
                  child: Text('Change',
                    style: TextStyle(color: Colors.blue, fontSize: 10.0),
                  ),
                  onPressed: () {

                  }
                ),
                Text('Mike Johnson',
                  style: TextStyle(color: Colors.black, fontSize: 11.0, fontWeight: FontWeight.bold),
                ),
                Text('So n so n so address',
                  style: TextStyle(color: Colors.black, fontSize: 11.0,),
                ),
              ],)
            ),
            Text('Seller Details'),
            ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(cartList[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  /*onDismissed: (direction) {
                    setState(() {
                      cartList.removeAt(index);
                   });
                  },*/
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete_outline)
                      ],
                    ),
                  ),
                  child: SellerDetailsCard(cart: cartList[index]),
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}

class SellerDetailsCard extends StatelessWidget {
  const SellerDetailsCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text("${cart.product.seller}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),),
            Text("${cart.product.address}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),),
            Text("${cart.product.phone}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),),
          ]
        )
      ],
    );
  }
}
