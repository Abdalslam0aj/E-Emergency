import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/services/TokenMaker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel {

  Future<bool> loginUser(String phoneNumber,String password) async {
    EEWebService service=new EEWebService();
    String token = await TokenMaker.getNotificationToken();
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    
    bool loged= await service.login(phoneNumber, password, token);    
    sharedPreferences.setBool('logedIn',loged);
    
    return loged;
  }

  userLogedIn() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getBool('logedIn');
  }





}