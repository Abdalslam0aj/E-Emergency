import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:E_Emergency/domain/services/TokenMaker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterModel {
  DateTime userDate;
  String bloodType;
  final String phoneNumber;
  final String fName;
  final String lName; 
  final String nationalID;   
  final String password;
  final String email;


  RegisterModel({
   this.phoneNumber,
   this.fName,
   this.lName,
   this.nationalID,
   this.password,
   this.email,
   this.userDate,
   this.bloodType   
  });

  dataVailed(BuildContext ctx) async {
    if(phoneNumber!=''&&fName!=''&&lName!=''&&nationalID!=''&&password!=''&&email!=''&&userDate!=null&&bloodType!='') {
      await _registerUser();

    } else {
        //alert dialog
    }
  }

  Future<bool> _registerUser() async {
    EEWebService webService= new EEWebService();
    String fullName=fName+' '+lName;
    String token = await TokenMaker.getNotificationToken();
    webService.register(phoneNumber, password, nationalID, fullName, bloodType, userDate, email, '',token ).then((value) {
     return value;
    });
    

  }

 



}