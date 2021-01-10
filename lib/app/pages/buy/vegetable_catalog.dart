import 'package:flutter/material.dart';
//import 'package:urban_roof/app/bloc/cart_items_block.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'package:urban_roof/app/models/allitemsmodel.dart';
import 'package:urban_roof/app/pages/buy/single_item_view.dart';

List<Item> vegetables = allItems.where((i) => i.type == 'vegetable').toList();

class VegetableCatalog extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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
                    buildContainerBottomNav(Icons.ballot, 'allitems', context),
                    //buildContainerBottomNav(Icons.notifications_on_rounded, 'notification', context),
                    buildContainerBottomNav(Icons.home, 'home', context),
                    buildContainerBottomNav(Icons.person, 'profile', context),
                    buildContainerBottomNav(Icons.shopping_cart, 'maincategory', context, isSelected: true),
                  ],
                ),
              )),
      drawer: builddrawerelement(context),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/maincategory')
        ), 
        title: Text('BUY VEGETABLES'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 2.0,
        actions: <Widget>[
          Container(
            height: 15.0,
            child: IconButton(
              icon: Icon(Icons.shopping_basket), 
              onPressed: () {Navigator.pushReplacementNamed(context, '/cart');}
            )
          ) 
        ],
      ),
      extendBodyBehindAppBar: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CatalogList(),
      )
        
     
    );
  }
}

class CatalogList extends StatelessWidget{
  
  const CatalogList({Key key, }) : super(key: key);

  Widget build(BuildContext context){
    
    //final double itemHeight = (size.height - kToolbarHeight - 150) / 2;
    //final double itemWidth = size.width / 2;

    return GridView.builder(
      itemCount: vegetables.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(10),
        child: ItemCard(item: vegetables[index]),
      )
    
  
                 
    );
          
      
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    @required this.item,
  }) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {

      return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return SingleItemView(type:item.type, image:item.images, title:item.title, context:context, qty:item.qty, price:item.price, seller:item.seller, address: item.address, desc: item.desc);
        }));
      },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height-644, 
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [new BoxShadow(
              color: Colors.grey[400],
              blurRadius: 20.0,
              ),],
            ),
                      
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Image.asset("${item.images}", fit: BoxFit.cover),
                  Expanded(child: Container(
                    height: MediaQuery.of(context).size.height/3, 
                    width: MediaQuery.of(context).size.width/2.5,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0),
                      )
                    ),
                    child: Column(
                      children: [
                        SizedBox(height:10.0),
                        Text(
                        '${item.title.toUpperCase()}\nRs.${item.price} for ${item.qty}',
                        style: TextStyle(fontSize: 20.0, )
                        ),
                      ]
                      ))
                  )
                ],
              )
            ),
          ),
        ]
      ),
    ),
  );
  }
}
