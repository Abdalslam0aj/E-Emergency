import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm;
  final BuildContext ctx;
  

  PushNotificationService(this._fcm,this.ctx);


  Future initialise() async {
    _fcm.getToken().then((token) {
    print(token); // Print the Token in Console
  });
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

   
    String token = await _fcm.getToken();
    print("FirebaseMessaging token: $token");

    _fcm.configure(
      
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }
}