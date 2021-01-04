import 'package:E_Emergency/domain/services/LoginModel.dart';
import 'package:E_Emergency/pages/CivilianMainMenu.dart';
import 'package:flutter/material.dart';

import 'RegisterPage.dart';

class Login extends StatelessWidget {
  final phoneNumber = TextEditingController();
  final userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Icon(Icons.account_circle, color: Colors.lightBlue, size: 200),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.lightBlueAccent, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'Enter Phone Number:',
                      labelStyle: TextStyle(color: Colors.white)),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  controller: phoneNumber)),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password:',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.lightBlueAccent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  controller: userPassword)),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              width: 350,
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  
                  LoginModel loginModel=new LoginModel();
                  loginModel.loginUser(phoneNumber.value.text, userPassword.value.text).then((value) {
                    if(value) {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>CivilianMainMenu()));
                    }
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30)),
              )),
          SizedBox(
            height: 20,
          ),
          FlatButton(
              child: Text(
                  'Don\'t have an account? Click here to create an account.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              }),
        ],
      ),
    );
  }
}

