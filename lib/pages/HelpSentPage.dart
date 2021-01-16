import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:E_Emergency/domain/services/firebaseFCM.dart';
import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:E_Emergency/widgets/SendHelpScreen/ConformationCard.dart';
import 'package:E_Emergency/widgets/SendHelpScreen/NewDesc.dart';
import 'package:E_Emergency/widgets/SendHelpScreen/TimeToArive.dart';
import 'package:E_Emergency/widgets/SurvayWdigets/OtherPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelpSentPage extends StatefulWidget {
  @override
  _HelpSentPageState createState() => _HelpSentPageState();
}

class _HelpSentPageState extends State<HelpSentPage> {
  String address;
  @override
  void initState() {
    PushNotificationService.ctx=context;
    // TODO: implement initState
     LocationFinder.getUserAddress().then((add){

         address=add;
          });
    super.initState();
  }

 
  
  Future<HelpRequest> _sendHelpRequest(String desc) async {
   EEWebService paramedicService =new EEWebService();
    SharedPreferences sh= await SharedPreferences.getInstance();  
    String userPhoneNumber =sh.getString('phoneNumber');
    return paramedicService.updateDescription(userPhoneNumber, desc);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Container(
         decoration: BoxDecoration(
           
                borderRadius: BorderRadius.circular(5),
                gradient: RadialGradient(colors:[Colors.lightBlue[800],Colors.lightBlue[700],Colors.lightBlue[700],Colors.lightBlue[600]])
              ),
        child:Column(
        children: [
          
          ConformationCard(),
          TimeToArive(),
          SizedBox(height: 60,),
          NewDesc(_sendHelpRequest),
          
          
          
        ],
      ), ),
      
    );
  }
}