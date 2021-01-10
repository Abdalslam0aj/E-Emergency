import 'package:E_Emergency/classes/User.dart';
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/services/TokenMaker.dart';
import 'package:E_Emergency/domain/services/route_generator_gard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel {

  Future<bool> loginUser(String phoneNumber,String password) async {
    EEWebService service=new EEWebService();
    String token = await TokenMaker.getNotificationToken();
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    
    User loged= await service.login(phoneNumber, password, token);
    if(loged.phoneNumber!=null && loged.userType!=null) {   
    sharedPreferences.setString('logedInUser',loged.userType.toString());
    sharedPreferences.setString('phoneNumber',loged.phoneNumber.toString());
     return true;    
    } else {
      return false;
    }
    
   
  }

  userLogedIn() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   
    if(sharedPreferences.getString('logedInUser')!=null)
    return true;
    else 
    return false;
  }

  userType() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   
    if(sharedPreferences.getString('logedInUser')=='paramedic')
    return true;
    else 
    return false;
  }

  static Future<void> logOutUser() async {
     SharedPreferences sh= await SharedPreferences.getInstance();
     await sh.setString('logedInUser', null);
     sh.setString('phoneNumber',null);
     RouteGenerator.userAuth=false;
    
     
     
  }





}