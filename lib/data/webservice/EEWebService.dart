import 'dart:convert';
import 'dart:io';
import 'package:E_Emergency/classes/Announcemnet.dart';
import 'package:E_Emergency/classes/Civilian.dart';
import 'package:E_Emergency/classes/NearestHospital.dart';
import 'package:E_Emergency/classes/TravelTime.dart';
import 'package:E_Emergency/classes/User.dart';
import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:dio/dio.dart';
import 'package:http/io_client.dart';
import 'package:E_Emergency/domain/Interface/EEWebServiceInterface.dart';
import 'package:http/http.dart' as http;

class EEWebService implements EEWebServiceInterface {
  static const String URL = "https://192.168.98.177:44390/";

/*
*this method takes the civilian phone number, latitude and longitude as a string 
*and sends it via http post to the api
*
*
*returns a true bool if the request is done 
*false other wise
*/
  Future<bool> sendHelpRequest(String phoneNumber, String latitude,
      String longitude, String desc, int numberOfHumans) async {
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
        'numberOfHumans': numberOfHumans.toString(),
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

  Future<Civilian> getUserInfo(String phoneNumber) async {
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
        Uri.parse(URL + 'GetUserInfo'),
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
        return Civilian.fromJson(jsonDecode(response.body));
      } else {
        print("not sent" + response.statusCode.toString());
        return Civilian.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
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

  Future<HelpRequest> updateDescription(
      String phoneNumber, String description) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<dynamic, dynamic> map = {
        'civilianPhoneNumber': phoneNumber,
        'description': description,
      };

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'UpdateDescription'),
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

  Future<HelpRequest> getMyRequest(String phoneNumber) async {
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
        Uri.parse(URL + 'GetMyHelpRequest'),
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

  Future<HelpRequest> timeToArrive(String phoneNumber) async {
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
        Uri.parse(URL + 'TimeToArrive'),
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
        'birthDate': birthDate.toString(),
        'email': email,
        'medicalCondition': medicalCondition,
        'notificationToken': notificationToken,
      };
      print(map);

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'RegisterCivilian'),
        body: map,
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);
      String boolAsString;
      boolAsString = response.body.toString();
      bool b = boolAsString == 'true';

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");
        return b;
      } else {
        print("not sent" + response.statusCode.toString());
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateCivilianProfile(
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
        'birthDate': birthDate.toString(),
        'email': email,
        'medicalCondition': medicalCondition,
        'notificationToken': notificationToken,
      };
      print(map);

      var head = {'Content-Type': 'application/json; charset=UTF-8'};
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.post(
        Uri.parse(URL + 'UpdateCivilian'),
        body: map,
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);
      String boolAsString;
      boolAsString = response.body.toString();
      bool b = boolAsString == 'true';

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");
        return b;
      } else {
        print("not sent" + response.statusCode.toString());
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Announcemnet> getAnnouncement() async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      var ioClient = new IOClient(client);

      http.Response response = await ioClient.get(
        Uri.parse(URL + 'GetAnnouncement'),
      );

      String reply = await response.body.toString();
      print("sent ");
      print(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        //if(httpResponse.body=="true")
        print("sent correctly");
        return Announcemnet.fromJson(jsonDecode(response.body));
      } else {
        print("not sent" + response.statusCode.toString());

        return Announcemnet.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return Announcemnet();
    }
  }

  Future<NearestHospital> hospitalLocation(
      String phoneNumber, double latitude, double longitude) async {
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<String, dynamic> map = {
        'civilianPhoneNumber': phoneNumber,
        'myLatitude': latitude,
        'myLongitude': longitude,
      };
      Dio dio = new Dio();
      FormData formData = FormData.fromMap({
        'civilianPhoneNumber': phoneNumber,
        'myLatitude': latitude,
        'myLongitude': longitude,
      });
      // var ioClient = new IOClient(client);
      final response = await dio.post(
          'https://192.168.98.177:44390/ArrivedAtLocation',
          data: formData);
      if (response.statusCode == 200) {
        //print(json.decode(response.body));

        print(response.data);
        return NearestHospital.fromJson(response.data);
      } else {
        throw Exception('Failed to load request');
      }
      // http.Response response = await ioClient
      //     .post(Uri.parse(URL + 'ParamedicTravelTime'), body: paramsMap);

    } catch (e) {
      print(e);
      //return arrivedAtLocation(phoneNumber, latitude, longitude);
    }
  }

  Future<TT> getTime(double originLatitude, double originLongitude,
      double destinationLatitude, double destinationLongitude) async {
    print(destinationLatitude);
    try {
      HttpClient client = new HttpClient();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      Map<String, double> paramsMap = {
        'paramedicLat': originLatitude,
        'paramedicLong': originLongitude,
        'civilianLat': destinationLatitude,
        'civilianLong': destinationLongitude
      };
      Dio dio = new Dio();
      FormData formData = FormData.fromMap(paramsMap);
      // var ioClient = new IOClient(client);
      final response = await dio.post(
          'https://192.168.98.177:44390/ParamedicTravelTime',
          data: formData);
      if (response.statusCode == 200) {
        //print(json.decode(response.body));

        print(response.data);
        return TT.fromJson(response.data);
      } else {
        throw Exception('Failed to load request');
      }
      // http.Response response = await ioClient
      //     .post(Uri.parse(URL + 'ParamedicTravelTime'), body: paramsMap);

    } catch (e) {
      print(e);
    }
  }
}
