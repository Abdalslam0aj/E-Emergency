import 'dart:async';

import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:E_Emergency/widgets/GoogleMapCivilian.dart';
import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:E_Emergency/pages/SendHelpRequestScreen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/AskForHelpWidget.dart';
import '../widgets/GovermentAnnouncementWidget.dart';
import '../widgets/TopBar.dart';
import 'HelpSentPage.dart';

class CivilianMainMenu extends StatefulWidget {
  
  @override
  _CivilianMainMenuState createState() => _CivilianMainMenuState();
}

class _CivilianMainMenuState extends State<CivilianMainMenu> {
  
  
  String loc="";
  static LocationData userLocation;
  static double lon;
  static double lat;
  //GoogleMaps googleMaps=new GoogleMaps();
  GooogleMapCivilian gooogleMapCivilian=new GooogleMapCivilian();
  
 // GooogleMapCivilian gg = new GooogleMapCivilian();
 
   void  _sendHelpRequest() {  
     Navigator.pushNamed(context, 'SendHelpRequest');
  }
  @override
  void initState() {
    SharedPreferences sg;
    SharedPreferences.getInstance().then((sp) {
      String phoneNumber =sp.getString('phoneNumber');
      print(phoneNumber);
     EEWebServiceInterface paramedicService=new EEWebService();
     paramedicService.checkRequest(phoneNumber).then((value) {
       if(value)
       Navigator.pushNamed(context, 'HelpSentPage');       
     } );
    new Timer(Duration(milliseconds: 300), getaddres);
    });
    super.initState();
  }
  
  getaddres(){
    LocationFinder.getUserAddress().then((address){
      setState(() {
         loc=address;
      });
     
     });
  }

  /*
  *
  *
  *
  *
  */
   

  @override
  Widget build(BuildContext context) {
    if(loc==''){
       LocationFinder.getUserAddress().then((address){
      setState(() {
         loc=address;
      });
     
     });

    }
    
    return Scaffold(
      body:
    Container(color: Colors.black,          
          child:Column(
            children: <Widget>[
              TopBar(),
              GovermentAnnouncementWidget(),
              AskForHelpWidget('Requst Medical Help',_sendHelpRequest),
              
          
                Stack(
                  children: [
                      
                    gooogleMapCivilian,
                      Container(
                        
                        margin: EdgeInsets.only(left:20,top: 15),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width*0.90,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0,2),
                  )],
                  borderRadius: BorderRadius.circular(5),
                  border: Border(),
                    
                ),
                             
                child: Padding(
                  padding: const EdgeInsets.only(top:12,left: 20,right: 20,bottom: 12),
                  child: Text(loc==""?'wait..':loc,style: TextStyle(color: Colors.blue),),
                ),
                 ),
                  ],
                ),          
              ],
              ),
    )
            
    );
  }
}