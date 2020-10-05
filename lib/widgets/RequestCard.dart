
import 'package:flutter/material.dart';

class RequestCard extends StatefulWidget {
  String name;
  String location;
  String description;
  String phoneNumber;
  RequestCard(this.name,this.description,this.location,this.phoneNumber);
  @override
  _RequestCardState createState() => _RequestCardState(name,location,description,phoneNumber);
}

class _RequestCardState extends State<RequestCard> {
  String name;
  String location;
  String description;
  String phoneNumber;
  _RequestCardState(this.name,this.description,this.location,this.phoneNumber);
  @override
  Widget build(BuildContext context) {
    return Card(
      
          elevation: 3,margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.black87,
            child: Column(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           Icon(Icons.account_circle, color: Colors.blue, size: 40),
           Container(
             child: Flexible(fit: FlexFit.tight,child: Text(name==null?'no Name':name,style: TextStyle(color: Colors.white)))),
                      
        ],),
        Text('Case Description',style: TextStyle(color: Colors.white)),
        Flexible(fit: FlexFit.tight,child:Text(description==null?'No description':description,style: TextStyle(color: Colors.white,fontSize: 30),) ),
        Row(children: <Widget>[
          IconButton(icon: Icon(Icons.location_on), onPressed: (){           
             // MapUtils.openMap(location);
             
           },iconSize: 40,color: Colors.red,),
          Text('Location',style: TextStyle(color: Colors.white))
        ],),
        Row(children: <Widget>[
          IconButton(icon: Icon(Icons.phone), onPressed: (){
            // launch(('tel://'+phoneNumber));
           },iconSize: 40,color: Colors.green,),
          Text(phoneNumber==null?'no number':phoneNumber,style: TextStyle(color: Colors.white))
        ],),

      ],),
        
      ),
    );
  }
}
       /* class MapUtils {

              MapUtils._();

             static Future<void> openMap(String loc) async {
             String googleUrl = 'https://www.google.com/maps/search/?api=1&query='+loc;
              if (await canLaunch(googleUrl)) {
              await launch(googleUrl);
            } else {
              throw 'Could not open the map.';
            }
             }
          }*/