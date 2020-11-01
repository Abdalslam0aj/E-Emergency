import 'package:http/http.dart' as http;


abstract class EEWebServiceInterface {
  
  Future<http.Response> sendHelpRequest(String phoneNumber,String latitude,String longitude);
  
  
}