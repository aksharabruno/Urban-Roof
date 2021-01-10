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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
            Container(
              alignment: Alignment.center,
              child: Text('Note: Make a note of this receipt for the time of delivery',
                      textAlign: TextAlign.center,),
              
            ),
            SizedBox(height:20,),
            Container(height: 20, color: Colors.green[100]),
            SizedBox(height:20,),
            Text('URBAN ROOF',
                  style: TextStyle(fontSize: 50.0, ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-135,
              child: Container(height: 2, color: Colors.green),
            ),
            SizedBox(height:40,),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all(color: Colors.green)),
              child: Text('Seller Details'),
            ),
            SizedBox(height:10,),
            ]),
            ListView.builder(
              itemCount: addedList.length,
              shrinkWrap: true,
              itemBuilder: (context,index)=>SellerDetails(seller: addedList[index],)),
            SizedBox(height: 20),
            Container(height: 1, color: Colors.green),
            SizedBox(height: 20),
            Row(children: [
              SizedBox(width:20),
              Text('Total:', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              SizedBox(width: 60,),
              Text('Rs. ${a.totalvalue()}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ],),
            SizedBox(height: 20),
            Container(height: 1, color: Colors.green),
          ]
        )
      ),
      bottomNavigationBar:  Container(
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
          child: FlatButton(
            onPressed: () {
              int n = addedList.length;
              addedList.removeRange(0, n);
              Navigator.pushReplacementNamed(context, '/home');
            }, 
              child: Text('DONE',
                style: TextStyle(color: Colors.white, fontSize: 30),  
              )
          ),
        )),
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

/*bottomNavigationBar: Container(
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
    ),*/
