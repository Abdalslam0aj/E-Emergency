import 'dart:async';
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:E_Emergency/widgets/countDownTimer.dart';
import 'package:flutter/material.dart';

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
    LocationFinder.getUserLocation().then((userLocation){});
   // paramedicService.sendHelpRequest(phoneNumber, latitude, longitude);

  }

  void timeEnd(){
    setState(() {
      ended=true;
      _sendHelpRequest();
      print("sent");
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
      
      child: !ended?CountDownTimer(controller,canselHelpRequest) : Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors:[Colors.blue[800],Colors.blue[800],Colors.blue[800],Colors.blue[300]])
              ),
              height: MediaQuery.of(context).size.height*0.23,
              width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,                    
                    children: <Widget>[
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.check_circle,color: Colors.green[700],size: 33,),
                        Flexible(
                          fit: FlexFit.tight,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 20, 5, 5),
                            child: Text("HelpRequest Sent a Paramedic team is on the way to your location ",
                            
                            style: TextStyle(color: Colors.white,fontSize: 23),
                            textAlign: TextAlign.start,),
                          ),
                        ),
                      ],
                ),
                 Container(
                   height: MediaQuery.of(context).size.height*0.07,
                   margin: EdgeInsets.all(5),
                   child: Row(
                                       
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Location",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,),
                          IconButton(icon: Icon(Icons.location_on), onPressed: (){}),
                          Flexible(
                            fit: FlexFit.tight,
                                                      child: Text(address==null?"wait...":address,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,),
                          ),
                        ],
                      ),
                 ),
                    ],
                  ),
            ),
            
        ],),
      ),
      
    )
    )
    );
  }
}