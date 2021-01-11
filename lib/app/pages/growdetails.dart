import 'package:flutter/material.dart';
import 'package:urban_roof/app/common/constants.dart';
import 'package:url_launcher/url_launcher.dart';
class GrowDetailsPage extends StatelessWidget {
  final String image;
  final String title;
  final BuildContext context;
  final String link;
  final String text;
  GrowDetailsPage({this.image, this.title, this.context, this.link, this.text});
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      
        body: Stack(
          
         alignment: Alignment.topCenter,
      children: [
        
        Image.asset("assets/images/crop$image.JPG",
         
            width: MediaQuery.of(context).size.width/2,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height /3),
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
             
            height: MediaQuery.of(context).size.height / 2.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              
              children: [
                Expanded(
                  child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                     
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    
                    SizedBox(height: 20),
                    Text('What you need to know to grow $title', style: TextStyle(fontSize: 30),),
                    SizedBox(height: 30),
                    Expanded(child: Text(text, style: TextStyle(fontSize: 20),))
                  

                  ],
                ))),
                Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                    child: FlatButton(
                      onPressed: () {
                        if(canLaunch(link) != null){
                           launch(link);
                        } else {
                          throw 'Could not load page';
                        }
                      },
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Read More...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ))
                  )
              ],
            ),
          ),
        ),
      ],
       
    ));
    
  }
}

