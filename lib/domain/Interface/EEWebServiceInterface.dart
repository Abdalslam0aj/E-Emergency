

abstract class EEWebServiceInterface {
  
  Future<bool> sendHelpRequest(String phoneNumber,String latitude,String longitude,String desc,int numberOfHumans);
  Future<bool> checkRequest(String phoneNumber);
  
  
  
}