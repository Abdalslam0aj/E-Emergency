import 'package:E_Emergency/widgets/AskForHelpWidget.dart';
import 'package:E_Emergency/widgets/CivilianMainMenu.dart';
import 'package:E_Emergency/widgets/GovermentAnnouncementWidget.dart';
import 'package:E_Emergency/widgets/ParamedicMainMenu.dart';
import 'package:E_Emergency/widgets/TopBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return MyAppState();
  }
}


class MyAppState extends State<MyApp> {
  bool _checkUserTypeCivilian(){
    
    return true;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(                
        body: Container(
          
          child:  _checkUserTypeCivilian()? CivilianMainMenu() :ParamedicMainMenu(),
        ),
        
      ),
    );
    
  }

}