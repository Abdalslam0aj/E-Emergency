import 'package:E_Emergency/classes/Civilian.dart';
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/services/route_generator_gard.dart';
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
   
    SharedPreferences sh= await SharedPreferences.getInstance();
    String phoneNumber =sh.getString('phoneNumber');
    EEWebService webService=new EEWebService();
    userProfile= await webService.getUserInfo(phoneNumber);
    setState(() {
      
    });
    
    print(userProfile.fullName);
  }

  @override
  Widget build(BuildContext context) {
    if(userProfile==null)
    {
      userProfile=Civilian(fullName: '',email: '',bloodType: '',birthDate: DateTime.now(),medicalCondition: '',nIDN: '',password: '',phoneNumber: '');
    }
    return Scaffold(
      body: Container(
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top:30,left: 10,right: 10,bottom: 20),
              color: Colors.lightBlue,
              child: Row(children: [
                Icon(Icons.person,size: 50,),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userProfile.fullName,style: TextStyle( fontSize: 25) ),
                    Text(userProfile.phoneNumber,style: TextStyle( fontSize: 10) ), 
                  ],
                ),
                             
                
              ],),
            ),
             Container(
                padding: EdgeInsets.only(top:1,left: 10,right: 10),
               color: Colors.blue,
               child:
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:[
            
             Divider(),
            Row(
              children: [
                Text('National id:   ',style: TextStyle( fontSize: 25,) ),
                Text(userProfile.nIDN,style: TextStyle( fontSize: 25,color: Colors.white) ),
              ],
            ),
            SizedBox(height: 20,),
             Divider(),
            Row(
              children: [
                Text('Email: ',style: TextStyle( fontSize: 25,) ),
                Text(userProfile.email,style: TextStyle( fontSize: 20,color: Colors.white) ),
              ],
            ),
             SizedBox(height: 20,),
             Divider(),
            Row(
              children: [
                Text('Date of birth:  ',style: TextStyle( fontSize: 25,) ),
                Text(userProfile.birthDate.year.toString()+'/'+userProfile.birthDate.month.toString()+'/'+userProfile.birthDate.day.toString(),style: TextStyle( fontSize: 25,color: Colors.white) ),
              ],
            ),
             SizedBox(height: 20,),
             Divider(),
            Row(
              children: [
                Text('blood type:   ',style: TextStyle( fontSize: 25,) ),
                Text(userProfile.bloodType,style: TextStyle( fontSize: 25,color: Colors.white) ),
              ],
            ),
            SizedBox(height: 20,),
             Divider(),
            Row(
              children: [
                Text('password:   ',style: TextStyle( fontSize: 25,) ),
                Text('************',style: TextStyle( fontSize: 25,color: Colors.white) ),
              ],
            ),
            SizedBox(height: 20,),
             Divider(),
            Row(
              children: [
                Text('Medical Condition:   ',style: TextStyle( fontSize: 25,) ),                
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              child:ListView(
                children: [
                  Text(userProfile.medicalCondition==null?'none':'\n'+userProfile.medicalCondition,style: TextStyle( fontSize: 25,color: Colors.white) ),
                ],
              )),
            
               ])
             ),

             Container(
               color: Colors.lightBlueAccent,
               child: Row(
                
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top:10,right: 20,bottom: 16),
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'EditInfoPage',arguments: userProfile );

                      },child:Text('edit profile',)),
                  ),
                ],
            ),
             ),
          ],
        ),
    )
      
    );
   
  }
}