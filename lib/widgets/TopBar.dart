import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      margin: EdgeInsets.fromLTRB(0,25, 0,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,            
        children: <Widget>[
          Container(        
               
            child: IconButton(icon: Icon(Icons.menu),color: Colors.black, onPressed: () =>{})),          
           Container(      
             alignment: Alignment.center,       
              child: Text(
                'E-Emergancy',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black),
                  
                  ),
            ),
                   
            Container(     
                           
                child: IconButton(
                  
                  icon: Icon(Icons.person,color: Colors.black,),
                   onPressed: () =>{})),
          
        ],
        ),
      
    );
  }
}