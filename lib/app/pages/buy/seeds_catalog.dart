import 'package:flutter/material.dart';
//import 'package:urban_roof/app/bloc/cart_items_block.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'package:urban_roof/app/pages/buy/single_item_view.dart';

class SeedCatalog extends StatelessWidget{
  
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
                    buildContainerBottomNav(Icons.notifications_on_rounded, 'notification', context),
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
        title: Text('BUY SEEDS'),
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
      body: 
        CatalogList(),
          
    );
  }
}

class CatalogList extends StatelessWidget{
  
  const CatalogList({Key key, }) : super(key: key);

  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 150) / 2;
    final double itemWidth = size.width / 2;

    return CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid.count(
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisSpacing: 0,
                mainAxisSpacing: 1,
                crossAxisCount: 2,
                children: <Widget>[
                  
                  buildProductView('seed','spinach','Spinach',context,itemHeight,itemWidth,1,50,'Sample Stores'),
                  //buildProductView('brinjal','Radish',context,itemHeight,itemWidth,1,50,'Sample Stores'),
                  buildProductView('seed','lettuce','Lettuce',context,itemHeight,itemWidth,1,50,'Sample Stores'),
                  buildProductView('seed','ladyfinger','Lady Finger',context,itemHeight,itemWidth,1,50,'Sample Stores'),
                  buildProductView('seed','yellowcapsicum','Yellow Capsicum',context,itemHeight,itemWidth,1,50,'Sample Stores'),
                  //buildProductView('cabbage','Cabbage',context,itemHeight,itemWidth,1,50,'Sample Stores'),
                  //buildProductView('carrot','Carrot',context,itemHeight,itemWidth,1,50,'Sample Stores'),
                  buildProductView('seed','tomato','Tomato',context,itemHeight,itemWidth,1,50,'Sample Stores'),
                  //buildProductView('3','Vege',context,itemHeight,itemWidth),                  
                  
                ],
              ),
            ),
          ],
        );
  }
}

GestureDetector buildProductView(String type, String image, String title, BuildContext context, double height, double width, double qty, double price, String seller){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return SingleItemView(type:type, image:image, title:title, context:context, qty:qty, price:price, seller:seller);
        }));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: height-50, 
            width: width,
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
                  Image.asset("assets/images/seed$image.jpg", fit: BoxFit.cover),
                  Expanded(child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: height/3,
                    width: width,
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
                        '${title.toUpperCase()}\nRs.$price for $qty pack of 25 gm',
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
