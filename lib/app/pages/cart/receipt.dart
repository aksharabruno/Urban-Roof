import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'package:urban_roof/app/common/constants.dart';
import 'package:urban_roof/app/pages/buy/single_item_view.dart';


class Receipt extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    Added a = new Added(product: null, numOfItem: null);
    return Scaffold(
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
            "RECEIPT",
            style: TextStyle(color: Colors.white),
          ), 
        ],
      ),
      ),
      drawer: builddrawerelement(context),
      bottomNavigationBar: Container(
        height: 200.0,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                //SizedBox(width: 100.0),
                Text('Total: ${a.totalvalue()}', style: TextStyle(fontSize: 20.0),),
                SizedBox(
                  width: 190,
                ),
              ]
            ),
            SizedBox(height: 0,/*getProportionateScreenHeight(20)*/),
            FlatButton(
              onPressed: () {
                int n = addedList.length;
                addedList.removeRange(0, n);
                Navigator.pushReplacementNamed(context, '/home');
              },
                  child: RaisedButton(
                    
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 40.0,
                      width: 150.0,
                      
                      child: Text('Click to continue', style: TextStyle(color: Colors.white, fontSize: 20.0),
                              textAlign: TextAlign.center,
                      ),
                    ),
                    
                    color: Colors.green,
                    onPressed: () {
                      showAlertDialog(context);
                    }
                  )
                ),
                SizedBox(height:30)
          ],
        ),
      ),
    ),
   /* body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            //height: 60.0,
            //color: Colors.grey[200],
            decoration: BoxDecoration(border: Border.all(color: Colors.green[100], width: 5.0),),
            child: 
              Text(
                'Note: Please take a screenshot of this receipt in case of future requirements.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 20.0),
              )
            ),
            
          ListView.builder(
            itemCount: addedList.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            child: SellerDetails(seller: addedList[index]),
            )
          ),
            /*Container(
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
            ),*/
            SizedBox(
              height: 8.0,
              child: Container(color: Colors.green[100],),
            ),
            
          ]
        ),
      )*/
    );
  }
}

class SellerDetails extends StatelessWidget {
  const SellerDetails({
    Key key,
    @required this.seller,
  }) : super(key: key);

  final Added seller;

  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(seller.product.images),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              seller.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            
            Text.rich(
              TextSpan(
                text: "Rs ${seller.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${seller.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('${seller.product.seller}'),
            Text('${seller.product.address}...'),
          ],
        )
      ],
    );
  }
}
