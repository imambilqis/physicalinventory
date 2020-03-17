import 'package:flutter/material.dart';
import 'package:physicalinventory/screen/count_screen.dart';

class CreateScreen extends StatefulWidget {
  static const id = 'CreateScreen';

  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  DateTime pickDate;

  Widget _buildNoTF() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery
          .of(context)
          .size
          .width / 1.2,
      height: 40,
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 5)]),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Document No',
        ),
      ),
    );
  }

  Widget _buildDateTF() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery
          .of(context)
          .size
          .width / 1.2,
      height: 40,
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 5)]),
      child: TextField(
        decoration: InputDecoration(
          hintText: ("Movement Date : ${pickDate.day}/${pickDate.month}/${pickDate.year}"),
        ),
        onTap: _pickDate,
      ),
    );
  }

  Widget _buildDescTF() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery
          .of(context)
          .size
          .width / 1.2,
      height: 40,
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 5)]),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Description',
        ),
      ),
    );
  }

  String _value, _value2, _value3;

  @override
  void initState() {
    super.initState();
    pickDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ])),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Physical Inventory'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: Column(children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 5,
                                      )
                                    ]),
                              ),
                              //DOC NO
                              _buildNoTF(),
                              //DOC TYPE
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 40,
                                padding: EdgeInsets.only(
                                    top: 4, left: 16, right: 16, bottom: 4),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.lightBlue,
                                          blurRadius: 5)
                                    ]),
                                child: new Center(
                                  child: DropdownButton<String>(
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Physical Inventory'),
                                        value: 'Physical Inventory',)
                                    ],
                                    onChanged: (String value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    },
                                    isExpanded: true,
                                    hint: Text('Document Type'),
                                    value: _value,
                                  ),
                                ),
                              ),
                              //WH
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 40,
                                padding: EdgeInsets.only(
                                    top: 4, left: 16, right: 16, bottom: 4),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFF61A4F1),
                                          blurRadius: 5)
                                    ]),
                                child: new Center(
                                  child: new DropdownButton<String>(
                                    items: [
                                      DropdownMenuItem(child: Text('Standard'),
                                        value: 'Standard',)
                                    ],
                                    onChanged: (String value) {
                                      setState(() {
                                        _value2 = value;
                                      });
                                    },
                                    isExpanded: true,
                                    hint: Text("Warehouse"),
                                    value: _value2,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 40,
                                padding: EdgeInsets.only(
                                    top: 4, left: 16, right: 16, bottom: 4),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFF61A4F1),
                                          blurRadius: 5)
                                    ]),
                                child: new Center(
                                  child: new DropdownButton<String>(
                                    items: [
                                      DropdownMenuItem(child: Text('Standard'),
                                        value: 'Standard',)
                                    ],
                                    onChanged: (String value) {
                                      setState(() {
                                        _value3 = value;
                                      });
                                    },
                                    isExpanded: true,
                                    hint: Text("Locator"),
                                    value: _value3,
                                  ),
                                ),
                              ),
                              //MovementDate
                              _buildDateTF(),
                              //Description
                              _buildDescTF(),
                              //button

                              Container(
                                height: 40,
                                margin: EdgeInsets.only(top: 40, bottom: 220),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                child: new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new RaisedButton(
                                        color: Colors.lightBlueAccent,
                                        elevation: 3.0,
                                        child: Text(
                                          "Complete",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        onPressed: () {},
                                      ),
                                      new RaisedButton(
                                        color: Colors.lightBlueAccent,
                                        elevation: 3.0,
                                        child: Text(
                                          "Count",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CountScreen()),
                                          );
                                        },
                                      ),
                                    ]),
                              )
                            ]),
                          ))))
            ])));
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime
            .now()
            .year - 5),
        lastDate: DateTime(DateTime
            .now()
            .year + 5),
        initialDate: pickDate
    );
    if (date != null)
      setState(() {
        pickDate = date;
      });
  }
}