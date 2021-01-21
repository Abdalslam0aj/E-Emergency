import 'package:E_Emergency/domain/services/LoginModel.dart';
import 'package:E_Emergency/domain/services/RegisterModel.dart';
import 'package:flutter/material.dart';

class FastHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var phoneNumber=new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
    body:
    Container(
      child: Column(
        children: [
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
                  SizedBox(height: 20,),
         SizedBox(
            width: double.infinity,
            height: 50,
          child:
          RaisedButton(
                color: Colors.redAccent,
                textColor: Colors.white,
                child: Text(
                  '   Request Help\nnot registerd user',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                   RegisterModel registerModel=new RegisterModel(
                      phoneNumber: phoneNumber.text.toString(),
                      password: '123456789AasA',
                      cpassword: '123456789AasA',
                      bloodType: 'o+',
                      userDate: DateTime.now(),
                      nationalID: '0000000000',
                      email: 'none',
                      fName: 'none',
                      lName: 'none',
                    );
                   registerModel.dataVailed(context).then((registerd){
                       print(registerd.toString()+" fst1 ");  
                     if(registerd) {
                        print(registerd.toString()+" ssd ");   
                   LoginModel login=new LoginModel();
                    login.loginUser(phoneNumber.text.toString(), '123456789AasA').then((loginOk){
                        print(loginOk.toString()+" ssd ");                 
                   if(loginOk) {
                      Navigator.pushNamed(context, 'MainMenu');
                   } else {
                     
                   }     

                    });  
                              
                 }
                   });
                   
                   
                },
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30))
             )),
        ],
      ),
    )
    );
  }
}