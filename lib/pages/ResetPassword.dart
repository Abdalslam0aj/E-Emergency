import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController phoneNumber=new TextEditingController();
  bool sent=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top:100,),
        child: Column(
          children: [
            Text('Reset password !',style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
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
                  'Reset Password',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  EEWebService service =new EEWebService();
                  service.resetPassowrd(phoneNumber.text.toString()).then((value) {
                    setState(() {
                      sent=value;
                    });
                    
                  });
                },
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30))
             )),
             !sent?Text('not rested yet',style: TextStyle(color: Colors.red),textAlign: TextAlign.center,):Column(
               children: [
                 Text('sent and rested',style: TextStyle(color: Colors.green)),
                 Icon(Icons.check_circle,size: 50,color: Colors.green,),
               ],
             )

          ],
        ),
      ),
      
    );
  }
}