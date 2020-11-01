import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class EEWebService implements EEWebServiceInterface{
static const String URL="http://10.0.2.2:44359/v1/hello";

/*
*this method takes the civilian phone number, latitude and longitude as a string 
*and sends it via http post to the api
*
*
*returns a true bool if the request is done 
*false other wise
*/
   Future<bool> sendHelpRequest(String phoneNumber,String latitude,String longitude) {     
     Future.sync((){       
       http.post(URL,headers:<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
         'phoneNumber': phoneNumber,
         'latitude': latitude,
         'longitude': longitude,
          }),          
      ).then((httpResponse) {
        if(httpResponse.statusCode==200||httpResponse.statusCode==201||httpResponse.statusCode==202) {
          return true;
        } else {
          return false;
        }
      });    
      });
    }
  


}