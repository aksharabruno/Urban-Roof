import 'package:flutter/material.dart';
//import 'package:urban_roof/app/models/cart1.dart';
//import 'package:urban_roof/app/models/product.dart';
//import 'package:urban_roof/app/pages/buy/cart_counter.dart';


class Product {
  final int id;
  final String title, seller, address, qty, type;
  final List<String> images;
  final price;
  final String phone;

  Product({
    @required this.id,
    @required this.images,
    @required this.title,
    @required this.price,
    @required this.seller,
    @required this.address,
    @required this.phone,
    @required this.qty,
    @required this.type,
  });
}


class Added {
  int index = 0;
  double total = 0;
  final Product product;
  int numOfItem;

  Added({@required this.product, @required this.numOfItem});

  double totalvalue(){
    for (Added p in addedList){
      total += p.product.price * p.numOfItem;
    }
    return total;
  }
}


List<Added> addedList = [];


class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }

  int totalnumber(){
    return numOfItems;
  }
}

class SingleItemView extends StatelessWidget {
  final String type;
  final String image;
  final String title;
  final BuildContext context;
  final double qty;
  final double price;
  final String seller;
  final String address;
  final String desc;

  SingleItemView({this.type, this.image, this.title, this.context, this.qty, this.price, this.seller, this.address, this.desc});
  
  @override
  Widget build(BuildContext context) {
    bool cond = true;
    
    int n = 0;
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
                _CartCounterState c = new _CartCounterState();
                n = c.totalnumber();
                Product p = new Product(
                  id: 1,
                  title: title,
                  seller: seller,
                  address: 'some address',
                  qty: '$qty',
                  images: ["assets/images/$type$image.jpg"],
                  price: price,
                  phone: '9999999999',
                  type: type
                );
                Added obj = new Added(product: (p), numOfItem: n);
                addedList.addAll({obj});
                setState(() { 
                  cond = false;
                });
                showAlertDialog(context);
               },
               
              icon: cond ? Icon(Icons.shopping_basket, color:Colors.white,) : Icon(Icons.check, color:Colors.white,),
              label: cond ? Text('Add to cart', style: TextStyle(color: Colors.white, fontSize: 20.0),) : Text('Added', style: TextStyle(color: Colors.white, fontSize: 20.0),),
              color:Colors.green,
              shape:StadiumBorder(),

              ),
              
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

  void setState(Null Function() param0) {}
}

showAlertDialog(BuildContext context){
  Widget continueButton = FlatButton(
    
    child: Icon(Icons.check, color: Colors.green[900],),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Item added to cart", textAlign: TextAlign.center,),
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
