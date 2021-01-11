//import 'dart:ui';

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
import 'grow.dart';
import 'detailspage.dart';

class HomePage extends StatelessWidget {
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
                buildContainerBottomNav(Icons.home, 'home', context,
                    isSelected: true),
                buildContainerBottomNav(Icons.person, 'profile', context),
                buildContainerBottomNav(
                    Icons.shopping_cart, 'maincategory', context),
              ],
            ),
          )),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 0,
          
          title: Text(
            "URBAN ROOF",
          ),
          actions: <Widget>[
            IconButton(
              icon: Container(child: Icon(Icons.search)),
              onPressed: () {},
            ),
          ],
        ),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Padding(padding: new EdgeInsets.all(5)),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Padding(padding: new EdgeInsets.all(2)),
              Text("Start your Farm",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  )),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildFlatButton(context, "Blogs", isSelected: true),
              buildFlatButton(context, "Grow"),
              buildFlatButton(context, "Reviews"),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[350],
                      spreadRadius: 1,
                      blurRadius: 15,
                    )
                  ]),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildColumnAtTop("Top", isSelected: true),
                        buildColumnAtTop("Popular"),
                        buildColumnAtTop("Trending"),
                        buildColumnAtTop("Editor's choice"),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyblogList(),
                    SizedBox(
                      height: 10,
                    ),
                    LineBar(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Text(
                            "Beginner Special",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "View All",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildBottomContainer("4", "Easy Chilli", "Author"),
                          buildBottomContainer(
                              "5", "Very green peas", "Author"),
                          buildBottomContainer(
                              "6", "Organic eggplants", "Author"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LineBar2(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildBottomContainer(String image, String text1, String text2) {
    return Container(
        height: 150,
        width: 240,
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                    height: 130,
                    width: 100,
                    child: Image.asset("assets/images/blog$image.jpg",
                        fit: BoxFit.cover))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    text2,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Column buildColumnAtTop(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.green[800] : Colors.grey,
            letterSpacing: 0.5,
          ),
        ),
        if (isSelected)
          Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.green[800],
                shape: BoxShape.circle,
              ))
      ],
    );
  }

  FlatButton buildFlatButton(context, text, {bool isSelected = false}) {
    return FlatButton(
      onPressed: () {
        if (text == 'Blogs') {
          Navigator.of(context).pushNamed('/home');
        }
        if (text == 'Grow') {
          Navigator.of(context).pushNamed('/grow');
        }
        if (text == 'Reviews') {
          Navigator.of(context).pushNamed('/home');
        }
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: isSelected ? Colors.white : Colors.black,
          letterSpacing: 0.5,
        ),
      ),
      shape: StadiumBorder(),
      color: isSelected ? Colors.lightGreen : Colors.grey[300],
    );
  }
}

class MyblogList extends StatelessWidget {
  const MyblogList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          buildColumnWithRow("1", "Fresh from Home", context),
          buildColumnWithRow("2", "The Real Veggies", context),
          buildColumnWithRow("3", "My small farm", context),
        ],
      ),
    );
  }

  GestureDetector buildColumnWithRow(
      String image, String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsPage(image: image, title: title, context: context);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: (Image.asset(
                  "assets/images/blog$image.jpg",
                  fit: BoxFit.cover,
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

class LineBar2 extends StatelessWidget {
  const LineBar2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.only(left: 25),
      alignment: Alignment.centerLeft,
      child: Container(
        height: 5,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class LineBar extends StatelessWidget {
  const LineBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 25),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Container(
        height: 5,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
