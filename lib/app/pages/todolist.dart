import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:urban_roof/app/common/common_widgets.dart';
//import 'package:flutter/src/rendering/object.dart';


var newtask;
List<String> tasks = [];

final newtaskCon = new TextEditingController();
class Todo extends StatefulWidget{
  @override
  _Todo createState() => _Todo();
}
class _Todo extends State<Todo> {
  bool cond = false;
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
                    buildContainerBottomNav(Icons.shopping_cart, 'maincategory', context),
                  ],
                ),
              )),
      backgroundColor: Colors.green,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 400,
            height: 600,
          ),
          Positioned(
            child: Text(
              "To Do List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            top: 40,
            left: 20,
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            minChildSize: 0.1,
            builder: (BuildContext context, ScrollController scrolController) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Dismissible(
                          key: Key(tasks[index]),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          background: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Icon(Icons.delete_outline),
                                SizedBox(width:20)
                              ],
                            ),
                          ),
                          
                          child: TaskCard(taskitem: tasks[index]),
                        ),
                        ),
                        controller: scrolController,
                      )
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.black,
                      onPressed: () {
                        print('hi');
                        _openPopup(context);
                      },
                    ),
                    top: -30,
                    right: 30,
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

_openPopup(context) {
  String newtask;
  final newtaskCon = new TextEditingController();
    Alert(
        context: context,
        title: "New Task",
        content: Column(
          children: <Widget>[
            TextField(
              controller: newtaskCon,
              decoration: InputDecoration(
                icon: Icon(Icons.edit_location_rounded),
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              newtask = newtaskCon.text;
              tasks.addAll({newtask});
              Navigator.of(context).pop();
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

class TaskCard extends StatelessWidget{
  const TaskCard({
    Key key,
    @required this.taskitem,
  }): super(key: key);

  final taskitem;
  
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/icons/app_icon.png'),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(child: Text(
              taskitem,
              style: TextStyle(color: Colors.black, fontSize: 18),
              maxLines: 2,
            ),),
            
            //SizedBox(height: 10),
          ],
        
      
    );
  }
}
