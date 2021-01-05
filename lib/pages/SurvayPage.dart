import 'dart:async';

import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:E_Emergency/widgets/SurvayWdigets/SurvayButton.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'HelpSentPage.dart';

class SurvayPage extends StatefulWidget {
  @override
  _SurvayPageState createState() => _SurvayPageState();
}

class _SurvayPageState extends State<SurvayPage> {

  EEWebServiceInterface paramedicService=new EEWebService();
  String address;
  Timer time;
  bool loading=false;
  finishSurvay(String desc) async {
   // time.cancel();
    setState(() {
      loading=true;
    });
    bool requestSent =await _sendHelpRequest(desc);
    int o=0;
    if (requestSent) {
      Navigator.pushNamed(context, 'HelpSentPage');     
     
    } else {
      print("loopp");
      finishSurvay(desc);
      
    }
    
   

  }

  Future<bool> _sendHelpRequest(String desc) async {
    LocationData userLocation=await LocationFinder.getUserLocation();  
    return paramedicService.sendHelpRequest("0780104148", userLocation.latitude.toString(), userLocation.longitude.toString(),desc);
  }

  @override
  void initState() {
    time= new Timer(Duration(seconds: 7),(){});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.black,
        body: loading?Container(
             margin: EdgeInsets.only(top:190,left: MediaQuery.of(context).size.width*0.44),
            child: Column(
              children: [
                Text('sending',style: TextStyle(color: Colors.blue),),
                SizedBox(height: 20,),
                CircularProgressIndicator(),
              ],
            )): Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SurvayButton(buttonText: 'Wonded/fracuter',buttonImge: 'assets/wound.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Chest/Heart\nPain',buttonImge: 'assets/wound.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Poisoning\nDrug overdose',buttonImge: 'assets/wound.png',onTap: finishSurvay,)
                    ],
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SurvayButton(buttonText: 'Car Accident',buttonImge: 'assets/wound.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Breathing\nDifficulties',buttonImge: 'assets/wound.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Abdominal/Back\nPain ',buttonImge: 'assets/wound.png',onTap: finishSurvay,)
                    ],
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SurvayButton(buttonText: 'Unconscious adult\n(lifeless) ',buttonImge: 'assets/wound.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Second/Third degree burns',buttonImge: 'assets/wound.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Other',buttonImge: 'assets/wound.png',onTap: finishSurvay,)
                    ],
                    
                  )
                ],
              )
            ],
          ) ,
      
        )
      )
    );
  }
}