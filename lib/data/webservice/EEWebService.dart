import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:http/http.dart' as http;




class EEWebService implements EEWebServiceInterface {
static const String URL="https://192.168.1.31:44390/ReciveHelpRequest";

Future<bool> sendHelpRequest1(String phoneNumber,String latitude,String longitude) async {
     try{
           

     var map = { 
         'civilianPhoneNumber': phoneNumber,
         'latitude': latitude,
         'longitude': longitude,
         'status':"Mcok",
         'description':'carCrash',
      };
      var head={
        'Content-Type': 'application/json; charset=UTF-8'
      };
      
      dynamic headers = {'Accept': 'application/json'};
      var response =await http.post(Uri.encodeFull(URL) ,body:map  ,);
      
  
     
        if(response.statusCode==200||response.statusCode==201||response.statusCode==202) {
       
           print("sent correctly");
          return true;
         
        } else {
           print("not sent"+response.toString());
          return false;
        }     
     }catch(e){
       print(e);

     }
 

  

   }
/*
*this method takes the civilian phone number, latitude and longitude as a string 
*and sends it via http post to the api
*
*
*returns a true bool if the request is done 
*false other wise
*/
   Future<bool> sendHelpRequest(String phoneNumber,String latitude,String longitude) async {
     try{
       HttpClient client = new HttpClient();
        client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
               

     Map<dynamic,dynamic> map = { 
         'civilianPhoneNumber': phoneNumber,
         'latitude': latitude,
         'longitude': longitude,
         'status':"Mcok",
         'description':'carCrash',
      };
      
 
   var head={
        'Content-Type': 'application/json; charset=UTF-8'
      };
    var ioClient = new IOClient(client);
    
     http.Response response = await ioClient.post(Uri.parse(URL), body: map,);
  

   String reply = await response.body.toString();
    print("sent ");
    print(response.body);     
     
        if(response.statusCode==200||response.statusCode==201||response.statusCode==202) {
          //if(httpResponse.body=="true")
           print("sent correctly");
          return true;
         
        } else {
           print("not sent"+response.statusCode.toString());
          return false;
        }     
     }catch(e){
       print(e);
       return false;
     }
 

  

   }
}