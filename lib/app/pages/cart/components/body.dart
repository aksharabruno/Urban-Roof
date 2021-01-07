import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:urban_roof/app/models/cart1.dart';
import 'package:urban_roof/app/pages/buy/single_item_view.dart';

//import '../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    

    if(addedList.length == 0){
      return Container(
        alignment: Alignment.center,
        child: Text('Oh! Your cart seems pretty light.',
                    style: TextStyle(fontSize: 20.0),
        ),
      );
    }
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: addedList.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(addedList[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                addedList.removeAt(index);
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
            child: CartCard(cart: addedList[index]),
          ),
        ),
      ),
    );
  }
}
