import 'package:flutter/material.dart';
//import 'package:urban_roof/app/bloc/cart_items_block.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'growdetails.dart';

class MyCrops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: builddrawerelement(context),
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
                      color: Colors.grey[300], blurRadius: 20, spreadRadius: 1)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainerBottomNav(Icons.ballot, 'allitems', context),
                buildContainerBottomNav(
                    Icons.notifications_on_rounded, 'notification', context),
                buildContainerBottomNav(Icons.home, 'home', context),
                buildContainerBottomNav(Icons.person, 'profile', context),
                buildContainerBottomNav(
                    Icons.shopping_cart, 'maincategory', context,
                    isSelected: true),
              ],
            ),
          )),
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 0,
       
        title: Text(
          "URBAN ROOF",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Container(child: Icon(Icons.search)),
            onPressed: () {},
          ),
        ],
      ),
     
      body: 
      CatalogList(),
      
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 270;
    final double itemWidth = size.width / 2;

    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid.count(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 2,
            children: <Widget>[
              buildProductView('3', 'Peas', context, itemHeight, itemWidth),
              buildProductView('4', 'Chilli', context, itemHeight, itemWidth),
              buildProductView('6', 'Tomato',context, itemHeight, itemWidth),
              buildProductView('2', 'Brinjal', context, itemHeight, itemWidth),
              buildProductView( '5', 'Spinach',context, itemHeight, itemWidth),
              buildProductView('1', 'Okra', context, itemHeight, itemWidth),
            ],
          ),
        ),
      ],
    );
  }
}

GestureDetector buildProductView(String image, String title,
    BuildContext context, double height, double width) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return GrowDetailsPage(image: image, title: title, context: context);
      }));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Container(
          height: 230,
          width: width,
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.grey[400],
                blurRadius: 20.0,
              ),
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Image.asset("assets/images/crop$image.JPG"),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: height / 3,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(20.0),
                                bottomRight: const Radius.circular(20.0),
                              )),
                          child: Column(children: [
                            SizedBox(height: 7.0),
                            Text('${title.toUpperCase()}',
                                style: TextStyle(
                
                                  fontSize: 15.0,
                                )),
                          ])))
                ],
              )),
        ),
      ]),
    ),
  );
}
