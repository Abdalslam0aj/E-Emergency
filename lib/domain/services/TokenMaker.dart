import 'package:firebase_messaging/firebase_messaging.dart';

class TokenMaker {

  static Future<String> getNotificationToken() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    String token= await _firebaseMessaging.getToken();
    
    return token;
  }
  
}