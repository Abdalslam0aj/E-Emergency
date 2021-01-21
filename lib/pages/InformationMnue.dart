import 'package:E_Emergency/domain/services/LoginModel.dart';
import 'package:flutter/material.dart';


class InformationMnue extends StatefulWidget {
  @override
  _InformationMnueState createState() => _InformationMnueState();
}

class _InformationMnueState extends State<InformationMnue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(        
        child: Column(
          children: [
            SizedBox(height:30),
            ListTile(leading: Text('your profile'),trailing: Icon(Icons.supervised_user_circle),onTap: (){
             Navigator.pushNamed(context, 'Profile'); 
            }, ),
            Divider(),
            ListTile(leading: Text('About us'),trailing: Icon(Icons.info),onTap: (){
              Navigator.pushNamed(context, 'AboutUs');
            }, ),
            Divider(),
            ListTile(leading: Text('logout'),trailing: Icon(Icons.logout),onTap: (){
                     LoginModel.logOutUser().then((value) {
                       Navigator.pushNamed(context, 'Login');
                     });
                     }, ),
            Divider(),
          ],          
        ),
      
    )
    );
  }
}