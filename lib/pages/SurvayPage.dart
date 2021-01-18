import 'dart:async';

import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:E_Emergency/widgets/SurvayWdigets/SurvayButton.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences sh= await SharedPreferences.getInstance();  
    String userPhoneNumber =sh.getString('phoneNumber');
    return paramedicService.sendHelpRequest(userPhoneNumber, userLocation.latitude.toString(), userLocation.longitude.toString(),desc,1);
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
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('select the condition that is similar to your condition select other to describe with words',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,),
                  ),
                  Text('the paramedic will contact you for more information',style: TextStyle(color: Colors.white),),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SurvayButton(buttonText: 'Wonded/fracuter',buttonImge: 'assets/wound.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Chest/Heart\nPain',buttonImge: 'assets/chest.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Poisoning\nDrug overdose',buttonImge: 'assets/poisoning.png',onTap: finishSurvay,)
                    ],
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SurvayButton(buttonText: 'Car Accident',buttonImge: 'assets/carcrash.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Breathing\nDifficulties',buttonImge: 'assets/hardbrething.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Abdominal/Back\nPain ',buttonImge: 'assets/backpain.png',onTap: finishSurvay,)
                    ],
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SurvayButton(buttonText: 'Unconscious adult\n(lifeless) ',buttonImge: 'assets/unconscious.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Second/Third degree burns',buttonImge: 'assets/fire.png',onTap: finishSurvay,),
                      SurvayButton(buttonText: 'Other',buttonImge: 'assets/exclamation.png',onTap: finishSurvay,)
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