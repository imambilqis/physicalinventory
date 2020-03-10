import 'package:flutter/material.dart';


class ReportScreen extends StatefulWidget{
  static const id="ReportScreen";
  final List<String> products;
  final List<int> quantity;

  ReportScreen({this.products,this.quantity});

  _ReportScreenState createState() => _ReportScreenState();

}
class _ReportScreenState extends State<ReportScreen>{
  Widget build(BuildContext context){
    num sum = 0;
    widget.quantity.forEach((num e){sum += e;});
    return Scaffold(
      appBar: AppBar(
        title: Text("Physical Inventory".toUpperCase(),
          textAlign: TextAlign.center,),
      ),

      body: ListView.builder(
          itemExtent: 30.0,
          itemCount: widget.products.length,
          semanticChildCount: widget.products.length,
          itemBuilder: (context,index){
            var rowSize = widget.products.length;
            return Row(
              children: <Widget>[
                Expanded(
                    child: ListTile(
                      dense:true,
                      title: new Center(child: index == rowSize  -1? Text('Total Qty',style: TextStyle(color: Colors.red),) : Text(widget.products[index]),),
                    )),
                Expanded(
                    child: ListTile(
                      dense:true,
                      title: new Center(child: index == rowSize -1 ? Text('$sum',style: TextStyle(color: Colors.red),) : Text('${widget.quantity[index]}'),),
                )),
              ],
            );
    }),
    );
  }
}