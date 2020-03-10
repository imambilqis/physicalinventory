import 'package:flutter/material.dart';
import 'package:physicalinventory/screen/create_screen.dart';
import 'package:physicalinventory/utilities/constants.dart';
class HomeScreen extends StatefulWidget{
  static const id = 'HomeScreen';
  _HomeScreenState createState()=> _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Physical Inventory".toUpperCase(),textAlign: TextAlign.center,),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateScreen()),
                  );},
                  icon:Icon(Icons.add,
                  )
              )
          )
        ],
        backgroundColor:Colors.blue ,
      ),
    );
  }
}