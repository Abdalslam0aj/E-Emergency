import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static Future<void> showLodingDialog(ctx) {
     showDialog(

       
        context: ctx,
        builder: (_) => new AlertDialog( 
          backgroundColor: Colors.white.withOpacity(0.2),
                       
              content:  new Row(
              children: [
              CircularProgressIndicator(),
              Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." ,)),
               ],),        
            ));
  }


}