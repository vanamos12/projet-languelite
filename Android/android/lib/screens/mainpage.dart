import 'package:flutter/material.dart';
import './loginpage.dart';
import './abonnementpage.dart';

class MainPage extends StatefulWidget{
  static const String id = 'mainpage';
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme:ThemeData(
         fontFamily: 'Brand-Regular',
         primarySwatch: Colors.blue,
       ),
        routes: {
          AbonnementPage.id: (context) => AbonnementPage(),
          LoginPage.id: (context) => LoginPage(),
          MainPage.id: (context) => MainPage()
        },
        initialRoute:LoginPage.id
    );
  }
}