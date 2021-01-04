import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/common_widgets.dart';

class MainCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context){
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
                              buildContainerBottomNav(Icons.notifications_on_rounded, '', context),
                              buildContainerBottomNav(Icons.home, 'home', context),
                              buildContainerBottomNav(Icons.person, 'profile', context),
                              buildContainerBottomNav(Icons.shopping_cart, '', context, isSelected: true),
                            ],
                          ),
                        )),
                drawer: builddrawerelement(context),
                appBar: AppBar(
                  title: Text('BUY'),
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
                body: Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'What would you like to buy?',
                            style: TextStyle(fontSize: 25.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 50.0),
                        Row(
                          children: [
                            buildRowWithColumn('vegetables','Vegetables',context),
                            buildRowWithColumn('saplings','Saplings',context),
                            buildRowWithColumn('seeds','Seeds',context),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              );
            }
          
            void setState(Null Function() param0) {}
}
GestureDetector buildRowWithColumn(String image, String title, BuildContext context) {
  var typecat;
  if (title == 'Vegetables')
    typecat = 'vegetablecatalog';
  else if (title == 'Saplings')
    typecat = 'saplingcatalog';
  else
    typecat = 'seedcatalog';

  return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, '/$typecat');
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
                  "assets/images/$image.jpg",
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
