import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//const String URL = "https://192.168.1.31:44390/ReciveHelpRequest";
//void main() => runApp(MyApp());

class HelpLocation extends StatefulWidget {
  LatLng locationOfEmergency;
  HelpLocation(this.locationOfEmergency);
  @override
  _MyAppState createState() => _MyAppState(locationOfEmergency);
}

class _MyAppState extends State<HelpLocation> {
  LatLng locationOfEmergency;
  _MyAppState(this.locationOfEmergency);
  Completer<GoogleMapController> _controller = Completer();

  //static const LatLng _center = const LatLng(32.017509, 35.890251);
  LatLng _center;
  void _onMapCreated(GoogleMapController controller) {
    _center = locationOfEmergency;
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Emergency Location'),
            backgroundColor: Colors.blue[300],
          ),
          backgroundColor: Colors.black,
          body: SafeArea(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(20),
              children: <Widget>[
                RaisedButton(
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    child: Text(
                      'View Info',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: null),
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  /*Future<String> getHelpRequestInfo() async {
    http.Response response = await http.get(Uri.encodeFull("url here"),
        headers: {"Accept": "application/json"});

    List helpRequestInfoList = jsonDecode(response.body);
    print(helpRequestInfoList[1]["civilianPhoneNumber"]);
  }*/
}
