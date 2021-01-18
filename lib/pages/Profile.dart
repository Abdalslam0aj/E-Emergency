import 'package:E_Emergency/classes/Civilian.dart';
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    setState(() async {
      
   
    SharedPreferences sh= await SharedPreferences.getInstance();
    String phoneNumber =sh.getString('phoneNumber');
    EEWebService webService=new EEWebService();
    userProfile= await webService.getUserInfo(phoneNumber);
     });
    print(userProfile.fullName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top:30,left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.person,size: 50,),
              SizedBox(width: 20,),
              Text(userProfile.fullName,style: TextStyle( fontSize: 25) ),             
              
            ],),
             SizedBox(height: 20,),
            Text(userProfile.email,style: TextStyle( fontSize: 25) ),
             SizedBox(height: 20,),
            Text(userProfile.birthDate.toString(),style: TextStyle( fontSize: 25) ),
             SizedBox(height: 20,),
            Text(userProfile.bloodType,style: TextStyle( fontSize: 25) ),
              

          ],
        ),
    )
      
    );
  }
}