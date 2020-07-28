import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0,25, 0,0),
      child: Row(        
        children: <Widget>[
          Container(            
            child: IconButton(icon: Icon(Icons.menu), onPressed: () =>{})),
          Container(
            margin: EdgeInsets.fromLTRB(95, 0,0, 0),
            child: Text(
              'E-Emergancy',
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlue),
                
                ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(101,0,0, 0),
            child: IconButton(
              icon: Icon(Icons.person),
               onPressed: () =>{})),
        ],
        ),
      
    );
  }
}