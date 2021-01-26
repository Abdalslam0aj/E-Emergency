import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/widgets/showCivilianInfo.dart';
import 'package:E_Emergency/widgets/showIncomingHelpRequestLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Classes/helpRequest.dart';
import 'ParamedicHelpWidgets/ParamedicProfile.dart';
import 'ParamedicHelpWidgets/StatusUpdate.dart';

// ignore: must_be_immutable
class InformationNavigation extends StatefulWidget {
  static bool arrivedAtEmergencyLocation = false;
  static bool requestEnded = false;
  HelpRequest helpRequest;
  static GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

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
    checkStatusOfRequest();
    endRequest();
    print(helpRequest.longitude.toString());
    List<Widget> _navigationPages = <Widget>[
      CivlianInformation(helpRequest),
      HelpLocation(helpRequest.latitude, helpRequest.longitude),
      RequestStatusUpdate(
      InformationNavigation.arrivedAtEmergencyLocation, helpRequest),
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Request'),
      ),
      body: Container(
        child: _navigationPages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(

        key: InformationNavigation.globalKey,
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
              backgroundColor: Colors.blue),         
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.lightBlue[200],
        onTap: (index) {
          onTappedNavBar(index);
        },
      ),
    );
  }

  void onTappedNavBar(var index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void checkStatusOfRequest() {
    setState(() {
      if (InformationNavigation.arrivedAtEmergencyLocation) {
        print(
            '${helpRequest.latitude} ${helpRequest.longitude}, ${helpRequest.description} ');

        ee
            .hospitalLocation(helpRequest.civilianPhoneNumber.toString(),
                helpRequest.latitude, helpRequest.longitude)
            .then((hospitalCoordinates) {
          helpRequest.latitude = hospitalCoordinates.latitude;
          helpRequest.longitude = hospitalCoordinates.longitude;
          print(
              '${hospitalCoordinates.id}, ${helpRequest.latitude} ${helpRequest.longitude}, ${helpRequest.description}');
        });
      }
    });
  }

  void endRequest() {
    setState(()  {
      if (InformationNavigation.requestEnded) {
        SharedPreferences.getInstance().then((value) {
       String userPhoneNumber =value.getString('phoneNumber');
        ee.endRequest(userPhoneNumber);

        }); 
        print(InformationNavigation.requestEnded);
        SystemNavigator.pop();
        
      }
    });
  }
}
