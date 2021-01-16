import 'package:E_Emergency/classes/Announcemnet.dart';
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:flutter/material.dart';


class GovermentAnnouncementWidget extends StatefulWidget {
  @override
  _GovermentAnnouncementWidgetState createState() => _GovermentAnnouncementWidgetState();
}

class _GovermentAnnouncementWidgetState extends State<GovermentAnnouncementWidget> {
  String wAnnouncement='No announcment issued';
  Announcemnet _announcemnet;


  @override
  void initState() {
    getAnnouncment();
    super.initState();
  }

  getAnnouncment() {
    EEWebService service=new EEWebService();
    service.getAnnouncement().then((announcemnet) {
      setState(() {
         _announcemnet=announcemnet;
         wAnnouncement=announcemnet.title;
      });
     
    } );    
  }

  readMore(ctx){
    EEWebService service=new EEWebService();
    service.getAnnouncement().then((announcemnet) {
      setState(() {
         _announcemnet=announcemnet;
         wAnnouncement=announcemnet.title;
      });
     
      
    showBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: ctx, builder:
    (BuildContext bc){
      

       return Container(
      
         width: double.infinity,
         height: 300,
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(wAnnouncement,style: TextStyle(fontSize: 30,color: Colors.red),),
                   IconButton(
                     color: Colors.red,
                     icon: Icon(Icons.cancel), onPressed: (){
                     Navigator.pop(ctx);
                   })
                 ]              
               ),
             ),
             Divider(thickness: 2,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(_announcemnet.readMore,textAlign: TextAlign.start,),
                  ],
                ),
              ),
           ],
         ),
       );

    }
     );
     } );  
  }
  
  
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
                children: <Widget>[Text(wAnnouncement,textAlign: TextAlign.center,style: TextStyle(color:Colors.red), ),
                FlatButton(onPressed: (){
                  if(_announcemnet!=null)
                  readMore(context);


                }, child:Text('ReadMore',style: TextStyle(fontSize: 10,color: Colors.blue),))                          
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