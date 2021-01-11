import 'package:E_Emergency/domain/services/RegisterModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState(); 
}

class _RegisterState extends State<Register> {
  DateTime pickedDate;
  String dropdownValue;
  final phoneNumberC = TextEditingController();
  final fNameC = TextEditingController();
  final lNameC = TextEditingController();
  final nationalID = TextEditingController();

  final bloodType = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();
  final email = TextEditingController();
  final ageC = TextEditingController();
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
                height: MediaQuery.of(context).size.height*0.67,
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
                    TextField(decoration: InputDecoration(labelText: 'first name',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                                  
                        style: TextStyle(color: Colors.white),
                    controller: fNameC,),
                    SizedBox(height: 10,),
                    TextField(decoration: InputDecoration(labelText: 'last name',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                                  
                        style: TextStyle(color: Colors.white),
                    controller: lNameC,),
                    SizedBox(height: 10,),
                    TextField(decoration: InputDecoration(labelText: 'national ID number',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                                 
                        style: TextStyle(color: Colors.white),
                    controller: nationalID,
                    keyboardType:  TextInputType.number,),
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
                    SizedBox(height: 10,),
                    TextField(
                      obscureText: true,                 
                     decoration: InputDecoration(labelText:'Password',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))
                     ),
                    
                        style: TextStyle(color: Colors.white),
                     controller: password,
                     keyboardType:  TextInputType.number,),
                      SizedBox(height: 10,),
                    TextField(
                     obscureText: true,               
                     decoration: InputDecoration(labelText:'confirem password',labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(15)))
                     ),
                    
                        style: TextStyle(color: Colors.white),
                     controller: cPassword,
                     keyboardType:  TextInputType.number,),
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
                    RegisterModel registerModel=new RegisterModel(
                      phoneNumber: phoneNumberC.text.toString(),
                      password: password.text.toString(),
                      cpassword: cPassword.text.toString(),
                      bloodType: dropdownValue.toString(),
                      userDate: pickedDate,
                      nationalID: nationalID.text.toString(),
                      email: email.text.toString(),
                      fName: fNameC.text.toString(),
                      lName: lNameC.text.toString(),
                    );
                   bool registerd= await registerModel.dataVailed(context);
                   print(registerd);
                  },child: Text('Register',),
                  shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                  )
            ],
          )));
  }
}