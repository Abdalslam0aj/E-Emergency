import 'dart:async';

import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeToArive extends StatefulWidget {
  @override
  _TimeToAriveState createState() => _TimeToAriveState();
}

class _TimeToAriveState extends State<TimeToArive> {
  double loadingValue;
  double fTime;
  double eTime;
  int eta;
  int pass;
  bool loading=true;
  DateTime dateEnd;
  DateTime dateAr;

  @override
  void initState() {
     progres();
   
    super.initState();
  }

   Future<void> progres() async {
     SharedPreferences sp = await SharedPreferences.getInstance();
     EEWebService service =new EEWebService();
     String phoneNumber =sp.getString('phoneNumber');
     HelpRequest helpTime=await service.timeToArrive(phoneNumber);
     print(helpTime.timeOfArrivel);
       dateAr =DateTime.parse(helpTime.timeOfArrivel);
       dateEnd =DateTime.parse(helpTime.timeOfEnd);
      DateTime dateNow=DateTime(2020,12,29,16,39,50);//DateTime.now();
      setState(() {
         eta =dateEnd.difference(dateAr).inSeconds;
         pass=dateNow.difference(dateAr).inSeconds;
         loadingValue=pass/eta;
      });
      _updateProgress();
     

     //fTime=helpTime.timeOfArrivel;

   }

    void _updateProgress() {
    const sec = const Duration(seconds:30 );  
    Timer timer;
    try {
    timer= new Timer.periodic(sec, (Timer t) {
      DateTime dateNow =DateTime(2020,12,29,16,40,50);// DateTime.now();      
      setState(() {
        pass=dateNow.difference(dateAr).inSeconds+2;  
        loadingValue = pass/eta;
        if (loadingValue >=1.0) {  
          loading = false;  
          t.cancel();  
          return;  
        }  
      });  
    });
    } catch (e) {
      print(e);
      timer.cancel();
    }  
  }  

  



  @override
  Widget build(BuildContext context) {    
    return Container(
      height: 80,      
      decoration: BoxDecoration(
         boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 5,offset: Offset(0, 1),spreadRadius: 0.5)],
        gradient: LinearGradient(colors:[Colors.lightBlue[400],Colors.blue[800],Colors.blue[800],Colors.blue[300]]),
        borderRadius: BorderRadius.circular(30)
      ),
      child: loading? Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.89,
            margin: EdgeInsets.only(left:20,right:20),
            child: Padding(
              padding: const EdgeInsets.only(top: 15), 
              //progres bar here                       
                child: Stack(
                  children: [                    
                    LinearProgressIndicator(
                      minHeight: 40,
                      backgroundColor: Colors.redAccent,
                      value: loadingValue,
                      valueColor:  new AlwaysStoppedAnimation<Color>(Colors.green),      
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(1, 1),spreadRadius: 4)],
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(80)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left:(MediaQuery.of(context).size.width-80)*loadingValue),
                        child: Image.asset('assets/ambulance.png',width: 40,height: 40,),
                       
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Padding(
            padding: const  EdgeInsets.only(left:20,right:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_city),
                     Icon(Icons.arrow_forward,size: 20,),
                  ],
                ),                
               
                Text(
                  ((eta-pass)/60).ceil().toString()+' Minutes to arrive '),
                Stack(
                  children: [
                    Icon(Icons.home_sharp),
                    Padding(
                      padding: const EdgeInsets.only(left:10 ),
                      child: Icon(Icons.location_pin,color: Colors.red,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ):Column(
        children: [
          LinearProgressIndicator(
            minHeight: 300,
            backgroundColor: Colors.red,
            value: 1.0,
            valueColor:  new AlwaysStoppedAnimation<Color>(Colors.red),      
          ),
          Text('Arrived '),
        ],
      )
      
      
    );
  }
}