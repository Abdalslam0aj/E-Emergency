import 'package:E_Emergency/domain/services/LoginModel.dart';
import 'package:flutter/material.dart';

class ParamedicProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        ListTile(
          leading: Text('logout'),
          trailing: Icon(Icons.logout),
          onTap: () {
            LoginModel.logOutUser().then((value) {
              Navigator.pushNamed(context, 'Login');
            });
          },
        ),
        Divider(),
      ],
    );
  }
}
