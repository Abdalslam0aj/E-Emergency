import 'dart:async';

import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:flutter/material.dart';
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
      var dateAr =DateTime.parse(helpTime.timeOfArrivel);
       dateEnd =DateTime.parse(helpTime.timeOfEnd);
      DateTime dateNow=DateTime(2020,12,29,16,41,30);//DateTime.now();
      setState(() {
         eta =dateEnd.difference(dateAr).inSeconds;
         pass=dateEnd.difference(dateNow).inSeconds;
         loadingValue=pass/eta;
      });
      _updateProgress();
     

     //fTime=helpTime.timeOfArrivel;

   }

    void _updateProgress() {  
    const sec = const Duration(seconds:30 );  
    new Timer.periodic(sec, (Timer t) {
      DateTime dateNow =DateTime(2020,12,29,16,43,30);// DateTime.now();      
      setState(() {
        pass=dateEnd.difference(dateNow).inSeconds;  
        loadingValue = pass/eta;
        if (loadingValue >=1.0) {  
          loading = false;  
          t.cancel();  
          return;  
        }  
      });  
    });  
  }  




  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: loading? Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.lightBlue,
            value: loadingValue,
            valueColor:  new AlwaysStoppedAnimation<Color>(Colors.red),      
          ),
          Text(((eta-pass)/60).toString()+' Minutes to arrive '),
        ],
      ):Column(
        children: [
          LinearProgressIndicator(
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