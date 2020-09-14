import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0,25, 0,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,            
        children: <Widget>[
          Container(        
               
            child: IconButton(icon: Icon(Icons.menu), onPressed: () =>{})),          
           Container(      
             alignment: Alignment.center,       
              child: Text(
                'E-Emergancy',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue),
                  
                  ),
            ),
                   
            Container(     
                           
                child: IconButton(
                  
                  icon: Icon(Icons.person),
                   onPressed: () =>{})),
          
        ],
        ),
      
    );
  }
}