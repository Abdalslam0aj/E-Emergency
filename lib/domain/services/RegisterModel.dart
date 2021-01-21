import 'package:E_Emergency/classes/Civilian.dart';
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:E_Emergency/domain/services/TokenMaker.dart';
import 'package:E_Emergency/widgets/DialogFactory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterModel {
  DateTime userDate;
  String bloodType;
  String medicalcondition;
  final String phoneNumber;
  final String fName;
  final String lName; 
  final String nationalID;   
  final String password;
  final String cpassword;
  final String email;


  RegisterModel({
   this.phoneNumber,
   this.fName,
   this.lName,
   this.nationalID,
   this.password,
   this.cpassword,
   this.email,
   this.userDate,
   this.bloodType,
   this.medicalcondition   
  });

  

  dataVailed(BuildContext ctx) async {
    if(phoneNumber!=''&&fName!=''&&lName!=''&&nationalID!=''&&password!=''&&email!=''&&userDate!=null&&bloodType!=''&&password==cpassword) {
      return await _registerUser();
      

    } else {
    
        DialogFactory.showRegisterDialog(ctx, 'Fill all required data', 'one of the requierd data is missing or empty');
          return false;
    }
  }

  isnumber(String number) {
    if(number.length==10) {
       

    }

  }

  Future<bool> _registerUser() async {
    EEWebService webService= new EEWebService();
    String fullName=fName+' '+lName;
    String token = await TokenMaker.getNotificationToken();
    print(userDate);    
    return await webService.register(phoneNumber, password, nationalID, fullName, bloodType, userDate, email, 'none',token );

  }

  Future<bool> updateUser(Civilian civilian) async {
    EEWebService webService= new EEWebService();
    String fullName=fName+' '+lName;
    String token = await TokenMaker.getNotificationToken();
     bool c;
    if(civilian.password == password){
      c=await webService.updateCivilianProfile(phoneNumber, cpassword, nationalID, fullName, bloodType, userDate, email, medicalcondition , token);
    } else if(password=='') {
       c=await webService.updateCivilianProfile(phoneNumber, civilian.password, nationalID, fullName, bloodType, userDate, email, medicalcondition , token);
    } 
   
    return c;
  }

 



}