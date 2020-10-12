import 'dart:async';

import 'package:E_Emergency/widgets/countDownTimer.dart';
import 'package:flutter/material.dart';

class SendHelpRequest extends StatefulWidget {
  @override
  _SendHelpRequestState createState() => _SendHelpRequestState();
}

class _SendHelpRequestState extends State<SendHelpRequest> {
  AnimationController controller;
  Widget countDownTimer;
  Timer d;
  bool ended=false;

  void timeEnd(){
    setState(() {
      ended=true;
      print("sent");
    });
  }
  @override
  void initState() {
   d= new Timer(Duration(seconds:5), timeEnd );
    super.initState();
  }
  void canselHelpRequest(){
    d.cancel();
    Navigator.pop(context);    

  }



 
  
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.black,
        body: 
     Container(            
      
      child: !ended?CountDownTimer(controller,canselHelpRequest) : Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("HelpRequest Sent",style: TextStyle(color: Colors.white),),
           

        ],),
      ),
      
    )
    )
    );
  }
}