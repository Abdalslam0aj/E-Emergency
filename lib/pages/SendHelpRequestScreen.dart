import 'dart:async';
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:E_Emergency/widgets/SendHelpScreen/ConformationCard.dart';
import 'package:E_Emergency/widgets/countDownTimer.dart';
import 'package:flutter/material.dart';

import 'SurvayPage.dart';

class SendHelpRequest extends StatefulWidget {
  @override
  _SendHelpRequestState createState() => _SendHelpRequestState();
}

class _SendHelpRequestState extends State<SendHelpRequest> {
  AnimationController controller; 
  EEWebServiceInterface paramedicService=new EEWebService();
  String address;
  Widget countDownTimer;
  Timer timeToSendRequest;
  bool ended=false;
  bool requestSent=false;
  void _sendHelpRequest() {
   LocationFinder.getUserLocation().then((userLocation){
     
   paramedicService.sendHelpRequest("0780104148", userLocation.latitude.toString(), userLocation.longitude.toString());

   });
    

  }

  void timeEnd(){
    setState(() {
      ended=true;
      _sendHelpRequest();
     // print("sent");
    });
  }
  @override
  void initState() {
   timeToSendRequest= new Timer(Duration(seconds:5), timeEnd );
    super.initState();
    setState(() {
        LocationFinder.getUserAddress().then((add){
         address=add;
       });
    });
  
  }
  void canselHelpRequest(){
    timeToSendRequest.cancel();
    Navigator.pop(context);    

  }



 
  
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.black,
        body: 
     Container(            
      
      child: !ended? CountDownTimer(controller,canselHelpRequest) : SurvayPage(),//ConformationCard(),
      
    )
    )
    );
  }
}