import 'package:E_Emergency/classes/Civilian.dart';
import 'package:E_Emergency/domain/services/LoginModel.dart';
import 'package:E_Emergency/domain/services/RegisterModel.dart';
import 'package:E_Emergency/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditInfoPage extends StatefulWidget {
  Civilian civilian;
  EditInfoPage(this.civilian);
  @override
  _EditInfoPageState createState() => _EditInfoPageState(); 
}

class _EditInfoPageState extends State<EditInfoPage> {
  DateTime pickedDate;
  String dropdownValue;
  final phoneNumberC = TextEditingController();
  final nationalID = TextEditingController();
  final bloodType = TextEditingController();
  final password = TextEditingController();
  final newPassword = TextEditingController();
  final email = TextEditingController();
  final medicalConditonC = TextEditingController();
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1930),
            lastDate: DateTime.now())
        .then((picked) {
      if (picked == null) {
        return;
      }
      setState(() {
        pickedDate = picked;
      });
    });
  }

  @override
  void initState() {
    widget.civilian;
       phoneNumberC.text=widget.civilian.phoneNumber;
       dropdownValue=widget.civilian.bloodType;
       pickedDate=widget.civilian.birthDate;
       email.text=widget.civilian.email;
       medicalConditonC.text=widget.civilian.medicalCondition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(30),
          
          color:Colors.black,          
          child:Column(
            children: [
               Icon(Icons.person_add, color: Colors.lightBlue, size: 130),
              Container(
                height: MediaQuery.of(context).size.height*0.65,
                child: ListView(
                  
                  children: <Widget>[
                   
                   TextField(               
                     decoration: InputDecoration(labelText:'PhoneNumber',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))
                     ),
                    
                        style: TextStyle(color: Colors.white),
                     controller: phoneNumberC,
                     keyboardType:  TextInputType.number,),
                     SizedBox(height: 10,),
                    TextField(decoration: InputDecoration(labelText: 'Medical Condition',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                        controller: medicalConditonC,         
                        style: TextStyle(color: Colors.white),
                   ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Blood type   ',style: TextStyle(color: Colors.lightBlueAccent),),
                        DropdownButton<String>(
                          
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.red),
                          underline: Container(
                          height: 2,
                          color: Colors.lightBlueAccent,
                         ),
                   onChanged: (String newValue) {
                        setState(() {
                        dropdownValue = newValue;
                   });
                 },
                   items: <String>['O+', 'O-', 'A+', 'A-','B+','B-','AB+','AB-']
                   .map<DropdownMenuItem<String>>((String value) {
                         return DropdownMenuItem<String>(
                          value: value,
                             child: Text(value),
                           );
                          }).toList(),
                         ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('leave empty for no password change',style: TextStyle(color: Colors.red),),
                    SizedBox(height: 10,),
                    TextField(
                      obscureText: true,                 
                     decoration: InputDecoration(labelText:'Old Password',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))
                     ),
                    
                        style: TextStyle(color: Colors.white),
                     controller: password,
                     ),
                      SizedBox(height: 10,),
                    TextField(
                     obscureText: true,               
                     decoration: InputDecoration(labelText:'New password',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))
                     ),
                    
                        style: TextStyle(color: Colors.white),
                     controller: newPassword,
                     ),
                    SizedBox(height: 10,),
                    TextField(               
                     decoration: InputDecoration(labelText:'email',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))
                     ),
                    
                        style: TextStyle(color: Colors.white),
                     controller: email,
                     keyboardType:  TextInputType.number,),
                    
                    Row(children: <Widget>[  Text(pickedDate==null ? 'No date set' : DateFormat.yMd().format(pickedDate),style: TextStyle(color: Colors.white),),
                    FlatButton(child: Text('Chose Date'),textColor: Colors.blue,onPressed: _showDatePicker,),          
                  
                    ],
                    ),
                 ]),
              ),
                RaisedButton(
                 color: Colors.lightBlueAccent,
                 textColor: Colors.white,
                  onPressed: () async {    
                    int d= widget.civilian.fullName.indexOf(' ');       
                    RegisterModel registerModel=new RegisterModel(
                      phoneNumber: phoneNumberC.text.toString(),
                      password: password.text.toString(),
                      fName: widget.civilian.fullName.substring(0,d).trim(),
                      lName: widget.civilian.fullName.substring(d).trim(),
                      cpassword: newPassword.text.toString(),
                      bloodType: dropdownValue.toString(),
                      userDate: pickedDate,
                      nationalID: widget.civilian.nIDN,
                      email: email.text.toString(),
                      medicalcondition: medicalConditonC.text.toString()+' '
                    );
                   bool registerd= await registerModel.updateUser(widget.civilian);
                   if(registerd) {
                     Navigator.pop(context);
                     Navigator.pushNamed(context, 'Profile');
                   }
                   print(registerd);
                  },child: Text('Update',),
                  shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                  )
            ],
          )));
  }
}