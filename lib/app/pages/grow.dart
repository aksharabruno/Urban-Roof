import 'package:flutter/material.dart';
//import 'package:urban_roof/app/bloc/cart_items_block.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'package:urban_roof/app/common/constants.dart';
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
                //buildContainerBottomNav(Icons.notifications_on_rounded, 'notification', context),
                buildContainerBottomNav(Icons.home, 'home', context, isSelected: true),
                buildContainerBottomNav(Icons.person, 'profile', context),
                buildContainerBottomNav(
                    Icons.shopping_cart, 'maincategory', context,
                    ),
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
              buildProductView('3', 'Peas', context, itemHeight, itemWidth, 'https://www.roysfarm.com/growing-peas/', peastext),
              buildProductView('4', 'Chilli', context, itemHeight, itemWidth, 'https://www.lovethegarden.com/uk-en/article/how-grow-chillies#:~:text=Soak%20chilli%20seeds%20overnight%20in%20warm%20water%20before,for%20a%20couple%20of%20days%20to%20improve%20germination.', chillitext),
              buildProductView('6', 'Tomato',context, itemHeight, itemWidth, 'https://www.allthatgrows.in/blogs/posts/how-to-grow-tomatoes-at-home-in-india', tomatotext),
              buildProductView('2', 'Brinjal', context, itemHeight, itemWidth, 'https://gardeningtips.in/growing-brinjal-in-pots-eggplant-at-home#:~:text=%20Plantation%20of%20seeds%20for%20growing%20brinjal%20in,sprout.%20When%20you%20plant%20more%20than...%20More', brinjaltext),
              buildProductView( '5', 'Spinach',context, itemHeight, itemWidth, 'https://www.thespruce.com/growing-spinach-1403448#:~:text=Sow%20the%20spinach%20seeds%20thinly%20in%20rows%20spaced,thin%20the%20plants%20to%20about%206%20inches%20apart.', spinachtext),
              buildProductView('1', 'Okra', context, itemHeight, itemWidth, 'https://gardentroubles.com/grow-lady-finger-plant-pot-home/', okratext),
            ],
          ),
        ),
      ],
    );
  }
}

GestureDetector buildProductView(String image, String title,
    BuildContext context, double height, double width, String link, String text) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return GrowDetailsPage(image: image, title: title, context: context, link: link, text: text);
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
