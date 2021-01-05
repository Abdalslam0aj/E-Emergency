import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'helpRequest.dart';

import 'package:dio/dio.dart';

class ApiRequests {
  static const String URL = 'https://192.168.1.31:44390/GetHelpRequest';
  List helpRequestInfoList;

  final json = const JsonCodec();
  Future<HelpRequest> fetchHelpRequest() async {
    // final response = await http
    //   .get(URL + 'GetHelpRequest/getHelpRequest' + 'Insert test number here');
    try {
      Dio dio = new Dio();

      Map<String, dynamic> requestHeaders = {'phoneNumber': '0795862772'};
      FormData formData = FormData.fromMap(requestHeaders);
      //final response =
      //  await http.get(Uri.encodeFull(URL), headers: requestHeaders);
      //print(URL);
      //  final response =
      //    await http.get(Uri.encodeFull(URL), headers: requestHeaders);
      final response = await dio.post(URL, data: formData);
      //var data = json.decode(response.body);
      if (response.statusCode == 200) {
        //print(json.decode(response.body));
        print(response.data);

        // If the server did return a 200 OK response,
        // then parse the JSON.
        // return HelpRequest.fromJson(json.decode(response.body));
        return HelpRequest.fromJson(response.data);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load request');
      }
    } catch (error) {
      print(error);
    }
  }
}
