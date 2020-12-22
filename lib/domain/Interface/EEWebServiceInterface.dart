

abstract class EEWebServiceInterface {
  
  Future<bool> sendHelpRequest(String phoneNumber,String latitude,String longitude,String desc);
  Future<bool> checkRequest(String phoneNumber);
  
  
  
}