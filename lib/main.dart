import 'package:E_Emergency/widgets/AskForHelpWidget.dart';
import 'package:E_Emergency/widgets/GovermentAnnouncementWidget.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(                
        body: Container(
          color: Colors.grey.shade200,          
          child:Column(
            children: <Widget>[TopBar(),GovermentAnnouncementWidget(),AskForHelpWidget('Ping an Emergency'),AskForHelpWidget('Ping a Fire')],),
            
        ),
        
      ),
    );
    
  }

}