import 'package:E_Emergency/widgets/GoogleMapCivilian.dart';
import 'package:E_Emergency/widgets/LocationFinder.dart';
import 'package:E_Emergency/widgets/RequestCard.dart';
import 'package:E_Emergency/widgets/SendHelpRequestWidget.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'AskForHelpWidget.dart';
import 'GovermentAnnouncementWidget.dart';
import 'TopBar.dart';

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
     print("Testing help Request");
     //To Do take user location info  
     Navigator.push(context, MaterialPageRoute(builder: (context)=>SendHelpRequest()));
     LocationFinder.getUserLocation().then((location){
       
       print(location);
       setState(() {
         loc=location.latitude.toString() +',' +location.longitude.toString();       
       });
     });         
    //return true;
  }
 

  /*
  *
  *
  *
  *
  */
   

  @override
  Widget build(BuildContext context) {
    
    return Container(color: Colors.black,          
          child:Column(
            children: <Widget>[
              TopBar(),
              GovermentAnnouncementWidget(),
              AskForHelpWidget('Requst Medical Help',_sendHelpRequest),
              Container(               
                child: Text(loc==""?'no Location sent':loc,style: TextStyle(color: Colors.blue),), ),
                gooogleMapCivilian,          
              ],
              ),
            
    );
  }
}