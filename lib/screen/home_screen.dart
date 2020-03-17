import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:physicalinventory/screen/create_screen.dart';
import 'package:physicalinventory/utilities/constants.dart';
class HomeScreen extends StatefulWidget{
  static const id = 'HomeScreen';
  _HomeScreenState createState()=> _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  List<String> DocumentNo=[
    "123456",
    "234561",
    "345612",
    "456123",
    "561234",
    "612345",
    "654321",
    "543216",
    "432165",
    "321654"

  ];
  List<String> Werehouse =[
    "Standard",
    "Standard",
    "Standard",
    "Standard",
    "Standard",
    "Standard",
    "Standard",
    "Standard",
    "Standard",
    "Standard",


  ];
  List<String> TotalQty =[
    "150",
    "20",
    "130",
    "100",
    "90",
    "95",
    "80",
    "170",
    "220",
    "100",

  ];
  /*List data = List();
  final String url="";
  Future<String> getData() async{
    var res = await http.get(Uri.encodeFull(url),
        headers: {"Accept": "application/json"});
    this.setState(() {
      data = json.decode(res.body);
    });

    print(data[1]["c_bpartner_id"]);

    return "Sucess";
  }
  @override
  void initState() {
    super.initState();
    this.getData();
  }*/
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
        backgroundColor:Color(0xFF61A4F1),
      ),
      body: ListView.builder(

        itemCount: DocumentNo.length,
        itemBuilder: (context,index){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: new ListTile(
                    title: new Center(child: Text(DocumentNo[index]) ,),
                  ),
              ),
              Expanded(
                flex: 4,
                child: ListTile(
                  title: new Center(child: Text(Werehouse[index]) ,),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListTile(
                  title: new Center(child: Text(TotalQty[index]) ,),
                ),
              ),

            ],
          );
        }
      )
    );
  }
}

/*class itemlist extends StatelessWidget {
  final List list;
  itemlist({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
     itemCount: list==null ? 0 : list.length,
     itemBuilder: (context,i){
       return new Text(list[i]['name']);
     },
    );
  }
}
 new FutureBuilder<List>(
        future: getData(),
          builder: (context,snapshot){
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new itemlist(list: snapshot.data,)
              : new Center(child: new CircularProgressIndicator(),);
      }
      ),
 */