import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/widgets/showCivilianInfo.dart';
import 'package:E_Emergency/widgets/showIncomingHelpRequestLocation.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Classes/helpRequest.dart';
import 'ParamedicHelpWidgets/StatusUpdate.dart';

// ignore: must_be_immutable
class InformationNavigation extends StatefulWidget {
  static bool arrivedAtEmergencyLocation = false;
  static bool requestEnded = false;
  HelpRequest helpRequest;
  InformationNavigation(this.helpRequest);
  _InformationNavigation createState() => _InformationNavigation(helpRequest);
}

class _InformationNavigation extends State<InformationNavigation> {
  int _currentIndex = 0;
  HelpRequest helpRequest;
  EEWebService ee = new EEWebService();
  _InformationNavigation(this.helpRequest);

  @override
  Widget build(BuildContext context) {
    // LatLng lng = Latlng(helpRequest.latitude, helpRequest.longitude);

    print(helpRequest.longitude.toString());
    List<Widget> _navigationPages = <Widget>[
      CivlianInformation(helpRequest),
      HelpLocation(helpRequest.latitude, helpRequest.longitude),
      RequestStatusUpdate(
          InformationNavigation.arrivedAtEmergencyLocation, helpRequest)
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Request'),
      ),
      body: Container(child: _navigationPages.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_device_information),
              label: 'Information',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Location',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Status',
              backgroundColor: Colors.blue)
        ],
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (InformationNavigation.arrivedAtEmergencyLocation) {
              ee
                  .arrivedAtLocation(helpRequest.civilianPhoneNumber,
                      helpRequest.latitude, helpRequest.longitude)
                  .then((hospitalCoordinates) {
                helpRequest.latitude = hospitalCoordinates.latitude;
                helpRequest.longitude = hospitalCoordinates.longitude;
              });
            }
          });
        },
      ),
    );
  }

  void endRequest() {
    setState(() {
      if (InformationNavigation.requestEnded) {
        ee.endRequest(helpRequest.civilianPhoneNumber);
        Navigator.of(context).pop();
      }
    });
  }
}
