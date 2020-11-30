import 'dart:convert';
import 'dart:io';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:http/http.dart' as http;

class EEWebService implements EEWebServiceInterface {
static const String URL="https://192.168.1.31:44390/ReciveHelpRequest";

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
Map<String, dynamic> toJson(){
  return{
     'civilianPhoneNumber': phoneNumber,
         'latitude': latitude,
         'longitude': longitude,
         'status':"Mcok",
         'description':'carCrash',
  };
}
     Map<String,String> map = { 
         'civilianPhoneNumber': phoneNumber,
         'latitude': latitude,
         'longitude': longitude,
         'status':"Mcok",
         'description':'carCrash',
      };
      

    HttpClientRequest request = await client.postUrl(Uri.parse(URL));

    request.headers.set('Content-Type', 'application/json; charset=UTF-8');
   
    
    request.add(utf8.encode(json.encode(toJson())));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();
    print("sent ");
    print(reply);     
     
        if(response.statusCode==200||response.statusCode==201||response.statusCode==202) {
          //if(httpResponse.body=="true")
           print("sent correctly");
          return true;
         
        } else {
           print("not sent"+response.headers.toString());
          return false;
        }     
     }catch(e){
       print(e);

     }
 

  

   }
}