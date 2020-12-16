import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SurvayButton extends StatelessWidget {
  String buttonText;
  String buttonImge;
  Color buttonBackGroundColor;
  Color textColor;

  SurvayButton({this.buttonText,this.buttonImge,this.textColor,this.buttonBackGroundColor});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){},
          child: Container(
        margin: EdgeInsets.only(top: 23,left:10,right: 10 ),
        height: MediaQuery.of(context).size.height*0.18,
        width: MediaQuery.of(context).size.width*0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:  Colors.red[400],

         ),
        
        child: Column(
          children: [
            SizedBox(height: 5,),
            Image.asset(buttonImge,height: 45,width: 45,),
            SizedBox(height: 10,),
            Text(buttonText,textAlign: TextAlign.center,),

          ],
        ),
        
      ),
    );
  }
}