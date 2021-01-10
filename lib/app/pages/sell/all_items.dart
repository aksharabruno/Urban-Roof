import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
//import 'package:urban_roof/app/models/allitemsmodel.dart';
import 'package:urban_roof/app/models/cart1.dart';
//import 'package:urban_roof/app/pages/cart/components/cart_card.dart';
//import 'package:urban_roof/app/pages/cart/components/body.dart';


class AllItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: builddrawerelement(context),
      appBar: buildAppBar(context),
      body: Body(),
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
                    buildContainerBottomNav(Icons.ballot, 'allitems', context, isSelected: true),
                   // buildContainerBottomNav(Icons.notifications_on_rounded, 'notification', context),
                    buildContainerBottomNav(Icons.home, 'home', context),
                    buildContainerBottomNav(Icons.person, 'profile', context),
                    buildContainerBottomNav(Icons.shopping_cart, 'maincategory', context),
                  ],
                ),
              )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "YOUR PRODUCE",
            style: TextStyle(color: Colors.white),
          ),
          
        ],
      ),
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
      
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(cartList[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                cartList.removeAt(index);
              });
            },
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
            child: CartCard(cart: cartList[index]),
          ),
        ),
      ),
    );
  }
}
class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

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
            Text.rich(
              TextSpan(
                text: "Rs ${cart.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                children: [
                  TextSpan(
                      text: " for ${cart.product.qty}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
