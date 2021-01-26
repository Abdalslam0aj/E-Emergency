import 'package:E_Emergency/domain/services/LoginModel.dart';
import 'package:flutter/material.dart';
import 'package:E_Emergency/pages/LoginPage.dart';

class ParamedicProfile extends StatelessWidget {
  BuildContext ctx;

  ParamedicProfile({this.ctx});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          ListTile(
            leading: Text('logout'),
            trailing: Icon(Icons.logout),
            onTap: () {
           LoginModel.logOutUser().then((value) {
                       Navigator.pushNamed(context, 'Login');
                     });
            }
          ),
          Divider(),
        ],
      ),
    );
  }
}
