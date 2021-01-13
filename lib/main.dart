import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'domain/services/firebaseFCM.dart';
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
   static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Future<bool> _checkUserTypeCivilian() async {
    await Firebase.initializeApp();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   String phoneNumber="+962780104148";
     
     FirebaseAuth auth= FirebaseAuth.instance;
     print('code  here  ?? ?? ?? ?? ?? ');
      auth.verifyPhoneNumber(
       

          timeout: const Duration(seconds: 59),
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential){
            
           // _smsCode=credential.smsCode;
          },           
          verificationFailed: (FirebaseAuthException e){
            if(e.code=='invalid-phone-number') {
              //To Do Alert User phone Number is invaild
            }
          }, 
          codeSent: (String verificationId, int resendToken)  {
            print('this is the verfication id = '+verificationId);
            
          
          },
          codeAutoRetrievalTimeout: (va){});
    
    return false;
  }



  @override
  Widget build(BuildContext context) {
  
    final pushNotificationService = PushNotificationService(_firebaseMessaging,context);
    pushNotificationService.initialise();
    
    
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: 'MainMenu', 
    );
    
  }

}