

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        margin: EdgeInsets.only(top:30,left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/EmergencyLogo.png',height: 100,width: 100,),
            Text('E-Emergency is a service dedicated to serve the Department of Civil Defense (DCD) in providing medical ambulance service to those in need.'
            +' The service system is comprised of two elements:\n(i) a server side application deployed at DCD or at a hosting data service,\n(ii) a client application compatible with the two most popular mobile platforms (Android/iOS).\nThe client-side application is installed on handheld devices and once the application is started and an emergency button is pressed, a help request is dispatched and received by DCD server.\nOn the server side, the operator assembles required resources and dispatches a rescue mission. Data for the rescue mission is extracted from the help-request message, which includes location and critical medical data of the person who issued the request'),
            SizedBox(height: 20,),
            Text('Developers: @Khaled Aladaileh @Abdalslam Aljamal'),
            SizedBox(height: 20,),
            Text('submitted in partial fulfilment of the requirements for the degree of Bachelor of:\nSoftware Engineering in information Technology'),

            

          ],
        )
        
    ) 
      
    );
  }
}