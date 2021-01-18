import 'package:E_Emergency/classes/Civilian.dart';
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 Civilian userProfile;
  @override
  void initState() {
    loadPrfile();
    super.initState();
  }

  loadPrfile() async {
    SharedPreferences sh= await SharedPreferences.getInstance();
    String phoneNumber =sh.getString('phoneNumber');
    EEWebService webService=new EEWebService();
    userProfile= await webService.getUserInfo(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(children: [
              Icon(Icons.person),
              Text(userProfile.fullName,style: TextStyle( fontSize: 25) ),
              
            ],),

          ],
        ),
    )
      
    );
  }
}