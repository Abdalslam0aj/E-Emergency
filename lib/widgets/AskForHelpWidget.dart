import 'package:flutter/material.dart';



class AskForHelpWidget extends StatelessWidget {
  String text;
  Function sendHelpRequest;
  AskForHelpWidget(this.text,this.sendHelpRequest);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5),         
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.black)
        ),          
        onPressed: ()  {
         sendHelpRequest();
         
        },              
        color: Colors.blue,
        child: Flexible(
                  fit: FlexFit.tight,
                  child: Container(
            margin: EdgeInsets.all(40),
            child: Text(          
              text,
              textAlign: TextAlign.center,
              style: TextStyle(            
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold),),
          ),
        ),
      ),

    );
  }
}