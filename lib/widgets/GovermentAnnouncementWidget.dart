import 'package:flutter/material.dart';


class GovermentAnnouncementWidget extends StatefulWidget {
  @override
  _GovermentAnnouncementWidgetState createState() => _GovermentAnnouncementWidgetState();
}

class _GovermentAnnouncementWidgetState extends State<GovermentAnnouncementWidget> {
  @override
  Widget  build(BuildContext context) {
    return Container(
       margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.red,),color: Colors.black,borderRadius: BorderRadius.circular(15)),      
      child:Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              children: <Widget>[
                
                Container(child: Icon(Icons.warning,color: Colors.red,size: 70,),),
               /* Container(child: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: ()=>{},),)*/
              ],),
          ),
          Flexible(
            fit: FlexFit.tight,
              child: Container(              
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(                
                children: <Widget>[Text('Covid19  Alert make sure to put mask on',textAlign: TextAlign.center,style: TextStyle(color:Colors.red), ),
                FlatButton(onPressed: ()=>{}, child:Text('ReadMore',style: TextStyle(fontSize: 10,color: Colors.blue),))                          
              ],),
            ),
          ),
         /* Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(children: <Widget>[
            Container(child: Icon(Icons.warning,color: Colors.red,),),
            Container(child: IconButton(icon:Icon(Icons.arrow_forward_ios),onPressed: ()=>{}),)

            ],),
          )*/
          

        ],) ,
      
    );
  }
}