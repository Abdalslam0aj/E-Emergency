import 'package:flutter/material.dart';

class NewDesc extends StatefulWidget {
  Function send;
  NewDesc(this.send);

  @override
  _NewDescState createState() => _NewDescState();
}

class _NewDescState extends State<NewDesc> {
  final TextEditingController textController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.only(left: 5,right: 5),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 5,offset: Offset(0, 1),spreadRadius: 0.5)],
        gradient: LinearGradient(colors:[Colors.lightBlue[800],Colors.blue[800],Colors.blue[800],Colors.blue[400]]),
        borderRadius: BorderRadius.circular(30)
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.40,      
      child: Column(
        children: [          
          Text('you can send more info  : ',style: TextStyle(fontSize: 30,color: Colors.black),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              borderOnForeground: true,
              color: Colors.white,
              child: TextFormField(
                 maxLines: null,
                style: TextStyle(color: Colors.black),
                 decoration: InputDecoration(
                   hintText: 'write more info here ',  

                   contentPadding:  const EdgeInsets. fromLTRB(0,0, 0, 100),
                   labelText:'',labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: const OutlineInputBorder(                                
                                    borderSide: const BorderSide(
                                      color: Colors.lightBlueAccent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15)))
                         ),            
                controller: textController,
                
              ),
            ),
          ),
          RaisedButton(
            color: Colors.lightBlue,
            onPressed: (){
            widget.send(textController.text.toString());
            setState(() {
              textController.clear();
            });
            
          },child: Text('send'),),

        ],
      ),
      
    );
  }
}