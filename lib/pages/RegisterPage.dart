import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState(); 
}

class _RegisterState extends State<Register> {
  DateTime pickedDate;
  final phoneNumberC = TextEditingController();
  final fNameC = TextEditingController();
  final lNameC = TextEditingController();
  final nationalID = TextEditingController();
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
            padding: EdgeInsets.all(60),
          
          color:Colors.black,          
          child:Column(
            
            children: <Widget>[
              Icon(Icons.person_add, color: Colors.lightBlue, size: 200),
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
              
              Row(children: <Widget>[  Text(pickedDate==null ? 'No date set' : DateFormat.yMd().format(pickedDate),style: TextStyle(color: Colors.white),),
              FlatButton(child: Text('Chose Date'),textColor: Colors.blue,onPressed: _showDatePicker,),          
            
              ],
              ),
            RaisedButton(
             color: Colors.lightBlueAccent,
             textColor: Colors.white,
              onPressed: (){},child: Text('Register',),
              shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30)),
              )])));
  }
}