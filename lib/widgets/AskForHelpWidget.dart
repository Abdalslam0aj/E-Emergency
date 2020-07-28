import 'package:flutter/material.dart';



class AskForHelpWidget extends StatelessWidget {
  String text;
  AskForHelpWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      
      width: double.infinity,
      height: 140,
      child: FlatButton(  
        onPressed: () => {},              
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(40),
          child: Text(          
            text,
            textAlign: TextAlign.center,
            style: TextStyle(            
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),),
        ),
      ),

    );
  }
}