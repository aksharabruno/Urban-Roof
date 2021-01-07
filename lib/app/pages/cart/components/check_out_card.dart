import 'package:flutter/material.dart';
//import 'package:urban_roof/app/models/cart1.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:urban_roof/app/pages/constants.dart';
import 'package:urban_roof/app/pages/buy/single_item_view.dart';
//import '../../size_config.dart';

class CheckoutCard extends StatelessWidget{
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Added a = new Added(product: null, numOfItem: null);
    return Container(
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
                  child: Row(children: [
                    Text("Proceed to checkout", style: TextStyle(color: Colors.black,)),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Colors.black,
                      )
                    ],)
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
                  width: 190,//getProportionateScreenWidth(190),
                  /*child: DefaultButton(
                    text: "Check Out",
                    press: () {},
                  ),*/
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
