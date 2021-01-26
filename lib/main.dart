import 'dart:io';

import 'package:E_Emergency/pages/ParamedicMainMenu.dart';
import 'package:E_Emergency/widgets/informationNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'data/webservice/EEWebService.dart';
import 'domain/services/firebaseFCM.dart';
import 'domain/services/route_generator_gard.dart';

void main() {
  runApp(MyApp());
  HttpOverrides.global = new MyHttpOverrides();
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyAppState extends State<MyApp> {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Future<bool> _checkUserTypeCivilian() async {
    await Firebase.initializeApp();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    String phoneNumber = "+962780104148";

    FirebaseAuth auth = FirebaseAuth.instance;
    print('code  here  ?? ?? ?? ?? ?? ');
    auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 59),
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // _smsCode=credential.smsCode;
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            //To Do Alert User phone Number is invaild
          }
        },
        codeSent: (String verificationId, int resendToken) {
          print('this is the verfication id = ' + verificationId);
        },
        codeAutoRetrievalTimeout: (va) {});

    return false;
  }

  @override
  Widget build(BuildContext context) {
    //final pushNotificationService = PushNotificationService(_firebaseMessaging);
    //pushNotificationService.initialise();
    //EEWebService ee = new EEWebService();

    return MaterialApp(
      home: ParamedicMainMenu(),
    );
  }
}
