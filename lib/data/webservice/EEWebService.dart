import 'dart:convert';
import 'dart:io';
import 'package:E_Emergency/classes/TravelTime.dart';
import 'package:E_Emergency/classes/User.dart';
import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:http/io_client.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:http/http.dart' as http;

class EEWebService implements EEWebServiceInterface {
  static const String URL = "https://192.168.1.31:44390/";
  static const String distanceMatrixURL =
      'https://maps.googleapis.com/maps/api/distancematrix/json';
/*
*this method takes the civilian phone number, latitude and longitude as a string 
*and sends it via http post to the api
*
*
*returns a true bool if the request is done 
*false other wise
*/
  Future<bool> sendHelpRequest(String phoneNumber, String latitude,
      String longitude, String desc) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<dynamic, dynamic> map = {
        'civilianPhoneNumber': phoneNumber,
        'latitude': latitude,
        'longitude': longitude,
        'status': "Mcok",
        'description': desc,
      };

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'ReciveHelpRequest'),
        body: map,
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");
        return true;
      } else {
        print("not sent" + response.statusCode.toString());
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> checkRequest(String phoneNumber) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<dynamic, dynamic> map = {
        'civilianPhoneNumber': phoneNumber,
      };

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'CheckRequest'),
        body: map,
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");
        if (response.body == 'true')
          return true;
        else
          return false;
      } else {
        print("not sent" + response.statusCode.toString());
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> arrivedAtLocation(
      String phoneNumber, String latitude, String longitude) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<dynamic, dynamic> map = {
        'civilianPhoneNumber': phoneNumber,
        'myLatitude': latitude,
        'myLongitude': longitude,
      };

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'ArrivedAtLocation'),
        body: map,
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");
        return true;
      } else {
        print("not sent" + response.statusCode.toString());
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endRequest(String phoneNumber) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<dynamic, dynamic> map = {
        'phoneNumber': phoneNumber,
      };

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'EndHelpRequest'),
        body: map,
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");
        return true;
      } else {
        print("not sent" + response.statusCode.toString());
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<HelpRequest> getRequest(String phoneNumber) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<dynamic, dynamic> map = {
        'phoneNumber': phoneNumber,
      };

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'GetHelpRequest'),
        body: map,
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");

        return HelpRequest.fromJson(jsonDecode(response.body));
      } else {
        print("not sent" + response.statusCode.toString());
        return HelpRequest.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> login(String phoneNumber, String password, String token) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<dynamic, dynamic> map = {
        'phoneNumber': phoneNumber,
        'password': password,
        'notiToken': token,
      };

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'LoginUser'),
        body: map,
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");
        return User.fromJson(jsonDecode(response.body));
      } else {
        print("not sent" + response.statusCode.toString());
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> register(
      String phoneNumber,
      String password,
      String nidn,
      String fullName,
      String bloodType,
      DateTime birthDate,
      String email,
      String medicalCondition,
      String notificationToken) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<dynamic, dynamic> map = {
        'phoneNumber': phoneNumber,
        'password': password,
        'NIDN': nidn,
        'FullName': fullName,
        'bloodType': bloodType,
        'birthDate': birthDate,
        'email': email,
        'medicalCondition': medicalCondition,
        'notificationToken': notificationToken,
      };

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'RegisterCivilian'),
        body: map,
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");
        return true;
      } else {
        print("not sent" + response.statusCode.toString());
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<TravelTime> getTravelTime(
      double originLatitude,
      double originLongitude,
      double destinationLatitude,
      double destinationLongitude) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<dynamic, dynamic> paramsMap = {
        'units': 'metric',
        'origins': '$originLatitude,$originLongitude',
        'destination': '$destinationLatitude,$destinationLongitude',
        'key': 'AIzaSyDP-Tm7tTT69M5hxxJy0fY-aTzyFSajJ1Q'
      };
      //distanceMatrixURL
//static const String distanceMatrixURL = 'https://maps.googleapis.com/maps/api/distancematrix/json';

      var uri = Uri.https(
          'maps.googleapis.com', '/maps/api/distancematrix/json', paramsMap);

      http.Response response = await http.get(uri);
      return TravelTime.fromJson(json.decode(response.body));
    } catch (e) {
      print(e + ' Not able to connect to the Google distance matrix API');
      // return false;
    }
  }
}
