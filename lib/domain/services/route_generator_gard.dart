import 'package:E_Emergency/domain/services/LoginModel.dart';
import 'package:E_Emergency/pages/CivilianMainMenu.dart';
import 'package:E_Emergency/pages/HelpSentPage.dart';
import 'package:E_Emergency/pages/LoginPage.dart';
import 'package:E_Emergency/pages/ParamedicMainMenu.dart';
import 'package:E_Emergency/pages/RegisterPage.dart';
import 'package:E_Emergency/pages/SendHelpRequestScreen.dart';
import 'package:E_Emergency/pages/SurvayPage.dart';
import 'package:E_Emergency/widgets/informationNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static  bool userAuth=false;
  static  bool _sr=false;
  static  bool userType=true;//flase civilian ||| true paramedic 
  
static Route<dynamic> generateRoute(RouteSettings settings)  {
  final args = settings.arguments;
   
  print(userAuth.toString()+'checked route');
// LoginScreen(model: new MainModel(),);
  
  if(!userAuth) {
    if (settings.name =='Register'){        
     return MaterialPageRoute(builder: (_)=>Register());
    }
    if(_sr) { 
      _sr=false;      
    return MaterialPageRoute(builder: (_)=>Login());
    }
     else {
    _sr=true;
    return MaterialPageRoute(builder: (_)=>Load());
    }
  }
 
  else {
     print(settings.name);
  switch (settings.name) {
    case 'Login':      
      return MaterialPageRoute(builder: (_)=>Login(),);    
    case 'MainMenu': if(userType){
      return MaterialPageRoute(builder: (_)=>ParamedicMainMenu());     
    } 
      return MaterialPageRoute(builder: (_)=>CivilianMainMenu());
    case 'Register':      
      return MaterialPageRoute(builder: (_)=>Register());
    case 'SendHelpRequest':      
      return MaterialPageRoute(builder: (_)=>SendHelpRequest());
    case 'SurvayPage':      
      return MaterialPageRoute(builder: (_)=>SurvayPage());
    case 'HelpSentPage':      
      return MaterialPageRoute(builder: (_)=>HelpSentPage());
    case 'InformationNavigation':      
      return MaterialPageRoute(builder: (_)=> InformationNavigation(args));     
    default:
    return MaterialPageRoute(builder: (_)=>Error());
      
  } 
}
}


}
class Load extends StatefulWidget {
  
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  
 @override
  void initState() {
    LoginModel loginModel=new LoginModel();
    loginModel.userLogedIn().then((value) async {
      RouteGenerator.userAuth=value;
      RouteGenerator.userType= await loginModel.userType();
      if(value) {
        Navigator.of(context).pushNamed('MainMenu');
      }
      else
        Navigator.of(context).pushNamed('Login');
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
             "assets/EmergencyLogo.png",
             height: 100,
             width: 100,
            ),
            
          ],
        ),
      ) ,
      
      
    );
  }
}
class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body:Container(
        margin: EdgeInsets.all(80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning,color: Colors.red,size: 45,),
            Text("This page does not exist "),
            Text("make sure your using the right name"),
            Text("This is a development error"),
          ],
        ),
      ) ,
      
      
    );
  }
}