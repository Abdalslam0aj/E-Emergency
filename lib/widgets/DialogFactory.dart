import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogFactory {
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

  static Future<void> showRegisterDialog(BuildContext ctx,String title,String text) {
     showDialog(
        context: ctx,
        builder: (_) => new AlertDialog(
          
          backgroundColor: Colors.white,
              content:  Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                width: MediaQuery.of(ctx).size.width*0.30,
                height: MediaQuery.of(ctx).size.height*0.25,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title,style: TextStyle(),),
                        IconButton(color: Colors.red,icon: Icon(Icons.cancel), onPressed: (){
                          Navigator.pop(ctx);
                        })
                      ],
                    ),
                    Text(text,style:TextStyle(fontSize: 25),),

                  ],
                )
              ),        
            ));
  }


}