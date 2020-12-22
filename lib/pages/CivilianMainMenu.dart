import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:E_Emergency/widgets/GoogleMapCivilian.dart';
import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:E_Emergency/pages/SendHelpRequestScreen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
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
  @override
  void initState() {
     EEWebServiceInterface paramedicService=new EEWebService();
     paramedicService.checkRequest('0780104148').then((value) {
       if(value)
       Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpSentPage()));
     } );
    // paramedicService.
    LocationFinder.getUserAddress().then((address){
      setState(() {
         loc=address;
      });
     
    });
    super.initState();
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
                  child: Text(loc==""?'no Location sent':loc,style: TextStyle(color: Colors.blue),),
                ),
                 ),
                  ],
                ),          
              ],
              ),
            
    );
  }
}