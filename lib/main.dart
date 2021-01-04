import 'package:E_Emergency/pages/LoginPage.dart';
import 'package:E_Emergency/widgets/AskForHelpWidget.dart';
import 'package:E_Emergency/pages/CivilianMainMenu.dart';
import 'package:E_Emergency/widgets/GovermentAnnouncementWidget.dart';
import 'package:E_Emergency/pages/ParamedicMainMenu.dart';
import 'package:E_Emergency/widgets/TopBar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.getToken().then((token) {
    print(token); // Print the Token in Console
  });
    return true;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
                      
        body: Container( 
          child:  _checkUserTypeCivilian()? Login() :ParamedicMainMenu(),
        ),
        
      ),
    );
    
  }

}