import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String title;
  final BuildContext context;
  DetailsPage({this.image, this.title, this.context});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset("assets/images/blog$image.jpg",
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
          height:MediaQuery.of(context).size.height/2.6,
          width:MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
             color:Colors.white,
             borderRadius: BorderRadius.only(
              topLeft:Radius.circular(30),
             topRight:Radius.circular(30),),
          ),
          child:Column(children: [
            Expanded(child:Column(children: [],)),
            Container(
              height:60,
            width:MediaQuery.of(context).size.width,
            color:Colors.green,
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
             Text("Read More...",
              style: TextStyle(color:Colors.white,
                      fontSize: 20,
                    ),)
              
            ],))
          ],),
          ),
        ),
      ],
    ));
  }
}
