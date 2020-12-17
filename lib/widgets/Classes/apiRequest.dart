import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'helpRequest.dart';

const String URL = 'http://localhost:60589/api/';

class ApiRequests {
  List helpRequestInfoList;

  /*Future<String> getHelpRequests() async {
    http.Response response = await http.get(
        Uri.encodeFull(
            URL + 'GetHelpRequest/getHelpRequest' + 'Insert test number here'),
        headers: {'Accept': 'application/json'});

    helpRequestInfoList = jsonDecode(response.body);
    print(helpRequestInfoList[1]["civilianPhoneNumber"]);
  }*/

  Future<HelpRequest> fetchHelpRequest() async {
    final response = await http
        .get(URL + 'GetHelpRequest/getHelpRequest' + 'Insert test number here');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return HelpRequest.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load request');
    }
  }
}
