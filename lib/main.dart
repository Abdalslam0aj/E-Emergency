import 'package:E_Emergency/pages/LoginPage.dart';
import 'package:E_Emergency/widgets/AskForHelpWidget.dart';
import 'package:E_Emergency/pages/CivilianMainMenu.dart';
import 'package:E_Emergency/widgets/GovermentAnnouncementWidget.dart';
import 'package:E_Emergency/pages/ParamedicMainMenu.dart';
import 'package:E_Emergency/widgets/TopBar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'domain/services/route_generator_gard.dart';

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
    return false;
  }



  @override
  Widget build(BuildContext context) {
    FirebaseMessaging fb=new FirebaseMessaging();
    fb.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        
      },
     //onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
       
      },
    );
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: 'MainMenu',      
     // home: Scaffold(
    //    body: Container( 
    //      child:  _checkUserTypeCivilian()? Login() :ParamedicMainMenu(),
      //  ),
        
    //  ),
    );
    
  }

}