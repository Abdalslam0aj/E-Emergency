import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:E_Emergency/domain/services/firebaseFCM.dart';
import 'package:E_Emergency/widgets/SendHelpScreen/ConformationCard.dart';
import 'package:E_Emergency/widgets/SendHelpScreen/TimeToArive.dart';
import 'package:flutter/material.dart';

class HelpSentPage extends StatefulWidget {
  @override
  _HelpSentPageState createState() => _HelpSentPageState();
}

class _HelpSentPageState extends State<HelpSentPage> {
  String address;
  @override
  void initState() {
    PushNotificationService.ctx=context;
    // TODO: implement initState
     LocationFinder.getUserAddress().then((add){

         address=add;
          });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:Column(
        children: [
          ConformationCard(),
          TimeToArive(),
          
          
          
        ],
      ), ),
      
    );
  }
}