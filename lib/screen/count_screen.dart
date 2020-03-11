import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:physicalinventory/screen/report_screen.dart';

class CountScreen extends StatefulWidget {
  final List<String> items;

  CountScreen({Key key, @required this.items}) : super(key: key);
  static const id = 'CountScreen';
  _CountScreenState createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  String barcode = "";
  bool isEdit = false;
  IconData iconChange = Icons.edit;
  List<bool> isEdits = [];
  List<IconData> iconChanges = [];
  List<String> isproduk = [
    "Sepatu",
    "Sandal",
    "Kemeja",
    "Topi",
    "Jas",
    "Dress",
    "Tas",
    "Kaos",
    "Syal",
    "Jeans"
  ];
  List<String> isqr = [
    "12345",
    "23451",
    "34512",
    "45123",
    "51234",
    "54321",
    "51234",
    "41235",
    "31245",
    "21345"
  ];
  List<TextEditingController> _controllers = [];
  List<int> quantity = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < isproduk.length; i++) {
      _controllers.add(TextEditingController());
      _controllers[i].text = '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Physical Inventory".toUpperCase(),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.search,
                  ))),
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: scan,
                  icon: Icon(
                    Icons.settings_overscan,
                  )))
        ],
      ),
      body: ListView.builder(
          itemCount: isproduk.length,
          itemBuilder: (context, index) {
            isEdits.add(false);
            iconChanges.add(Icons.edit);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: ListTile(
                    title: Text(isproduk[index]),
                    subtitle: Text(isqr[index]),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    title: FlatButton(
                        padding: EdgeInsets.all(0.5),
                        onPressed: (){
                          setState(() {
                            _controllers[index].text != '0' ? _controllers[index].text = '${int.parse(_controllers[index].text)- 1}' : null;  
                          });
                          },
                        child: Icon(
                          Icons.remove,size: 24,
                        )),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: TextField(
                      controller: _controllers[index],
                      enabled: isEdits[index],
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black)),
                          isDense: true,
                          counterText: ''),
                      maxLines: 1,
                      maxLength: 6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    title: FlatButton(
                        padding: EdgeInsets.all(0.5),
                        onPressed: (){
                          setState(() {
                            _controllers[index].text = '${int.parse(_controllers[index].text)+1}';
                          });
                          },
                        child: Icon(
                            Icons.add
                        )),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: ListTile(
                      title: FlatButton(
                          padding: EdgeInsets.all(0.5),
                          onPressed: () {
                            setState(() {
                              isEdits[index] = !isEdits[index];
                              iconChanges[index] = isEdits[index] == true
                                  ? Icons.save
                                  : Icons.edit;
                            });
                          },
                          child: Icon(
                            iconChanges[index],
                            size: 24,
                          )),
                    ))
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          quantity.clear();
          for (int i = 0; i < _controllers.length; i++) {
            quantity.add(int.parse(_controllers[i].text));
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReportScreen(products: isproduk,quantity: quantity,),
            ),
          );
        },
        backgroundColor: Colors.lightBlue,
      ),

    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);

      int position = isqr.indexOf(barcode);
      _controllers[position].text =
          '${int.parse(_controllers[position].text) + 1}';
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
