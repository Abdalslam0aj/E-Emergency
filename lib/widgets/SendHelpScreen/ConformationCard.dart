import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:flutter/material.dart';

class ConformationCard extends StatefulWidget {
  
  @override
  _ConformationCardState createState() => _ConformationCardState();
}

class _ConformationCardState extends State<ConformationCard> {
   String address='wait...';

  
  void initState() {  
    super.initState();   
        LocationFinder.getUserAddress().then((add){
          setState(() {
             address=add;
          });
        }); 
  }
    





  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors:[Colors.blue[800],Colors.blue[800],Colors.blue[800],Colors.blue[300]])
              ),
              height: MediaQuery.of(context).size.height*0.23,
              width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,                    
                    children: <Widget>[
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.check_circle,color: Colors.green[700],size: 33,),
                        Flexible(
                          fit: FlexFit.tight,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 20, 5, 5),
                            child: Text("Help Request Sent, a Paramedic team is on the way to your location ",
                            
                            style: TextStyle(color: Colors.white,fontSize: 23),
                            textAlign: TextAlign.start,),
                          ),
                        ),
                      ],
                ),
                 Container(
                   height: MediaQuery.of(context).size.height*0.07,
                   margin: EdgeInsets.all(5),
                   child: Row(
                                       
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Location",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,),
                          IconButton(icon: Icon(Icons.location_on), onPressed: (){}),
                          Flexible(
                            fit: FlexFit.tight,
                                   child: Text(address==null?"wait...":address,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,),
                          ),
                        ],
                      ),
                 ),
                    ],
                  ),
            ),
            
        ],),
      );
  }
}