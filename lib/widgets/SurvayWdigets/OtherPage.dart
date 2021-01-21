import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  Function send;
  OtherPage(this.send);
  final TextEditingController textController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,      
      child: Column(
        children: [
          SizedBox(height: 100,),
          Text('describe your case : ',style: TextStyle(fontSize: 30,color: Colors.white),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              borderOnForeground: true,
              color: Colors.black,
              child: TextFormField(
                 maxLines: null,
                style: TextStyle(color: Colors.white),
                 decoration: InputDecoration(
                   contentPadding:  const EdgeInsets.symmetric(vertical: 40.0),
                   labelText:'',labelStyle: TextStyle(color: Colors.white),
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

            send(textController.text.toString());
          },child: Text('send'),),

        ],
      ),
      
    ));
  }
}