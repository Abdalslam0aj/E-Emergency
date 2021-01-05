import 'package:E_Emergency/widgets/showCivilianInfo.dart';
import 'package:E_Emergency/widgets/showIncomingHelpRequestLocation.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Classes/helpRequest.dart';

// ignore: must_be_immutable
class InformationNavigation extends StatefulWidget {
  HelpRequest helpRequest;
  InformationNavigation(this.helpRequest);
  _InformationNavigation createState() => _InformationNavigation(helpRequest);
}

class _InformationNavigation extends State<InformationNavigation> {
  int _currentIndex = 0;
  HelpRequest helpRequest;
  _InformationNavigation(this.helpRequest);

  @override
  Widget build(BuildContext context) {
    print(helpRequest.longitude.toString());
    List<Widget> _navigationPages = <Widget>[
      CivlianInformation(helpRequest),
      HelpLocation(helpRequest),
      CivlianInformation(helpRequest)
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Request'),
      ),
      body: Container(child: _navigationPages.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Location',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_device_information),
              label: 'Information',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Status',
              backgroundColor: Colors.blue)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
