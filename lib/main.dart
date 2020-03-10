import 'package:flutter/material.dart';
import 'package:physicalinventory/screen/count_screen.dart';
import 'package:physicalinventory/screen/create_screen.dart';
import 'package:physicalinventory/screen/login_screen.dart';
import 'package:physicalinventory/screen/home_screen.dart';
import 'package:physicalinventory/screen/report_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'physical inventory',
      theme: ThemeData.light(),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
        HomeScreen.id:(context)=>HomeScreen(),
        CreateScreen.id:(context)=>CreateScreen(),
        CountScreen.id:(context)=>CountScreen(),
        ReportScreen.id:(context)=>ReportScreen()
      },
    );
  }
}
