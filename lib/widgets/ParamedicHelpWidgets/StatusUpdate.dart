import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../informationNavigation.dart';

// ignore: must_be_immutable
class RequestStatusUpdate extends StatefulWidget {
  bool arrivedAtEmergencyLocation;
  HelpRequest helpRequest;
  RequestStatusUpdate(this.arrivedAtEmergencyLocation, this.helpRequest);
  @override
  _RequestStatusUpdate createState() => _RequestStatusUpdate();
}

class _RequestStatusUpdate extends State<RequestStatusUpdate> {
  @override
  Widget build(BuildContext context) {
    if (!widget.arrivedAtEmergencyLocation) {
      return Center(
          child: Column(children: <Widget>[
        Card(
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: Container(
                  width: 300,
                  height: 100,
                  child: Text(
                      'Request status: on the way to the emergency location'),
                ))),
        FlatButton(
            onPressed: () {
              showNearestHospital();
            },
            child: Text('Show nearest hospital')),
      ]));
    } else {
      return Center(
          child: Column(children: <Widget>[
        Card(
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: Container(
                  width: 300,
                  height: 100,
                  child: Text('Request status: on the way to the hospital'),
                ))),
        FlatButton(
            onPressed: () {
              endRequest();
            },
            child: Text('End request')),
      ]));
    }
  }

  final BottomNavigationBar navigationBar =
      InformationNavigation.globalKey.currentWidget;

  void showNearestHospital() {
    InformationNavigation.arrivedAtEmergencyLocation = true;

    navigationBar.onTap(0);

    //print(InformationNavigation.arrivedAtEmergencyLocation);
  }

  void endRequest() {
    InformationNavigation.arrivedAtEmergencyLocation = false;
    InformationNavigation.requestEnded = true;

    navigationBar.onTap(0);
   // SystemNavigator.pop();
  }
}

/*
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:flutter/material.dart';

import '../informationNavigation.dart';

// ignore: must_be_immutable
class RequestStatusUpdate extends StatefulWidget {
  bool arrivedAtEmergencyLocation;
  HelpRequest helpRequest;
  RequestStatusUpdate(this.arrivedAtEmergencyLocation, this.helpRequest);
  @override
  _RequestStatusUpdate createState() => _RequestStatusUpdate();
}

class _RequestStatusUpdate extends State<RequestStatusUpdate> {
  @override
  Widget build(BuildContext context) {
    if (!widget.arrivedAtEmergencyLocation) {
      return Center(
          child: Column(children: <Widget>[
        Card(
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: Container(
                  width: 300,
                  height: 100,
                  child: Text(
                      'Request status: on the way to the emergency location'),
                ))),
        RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("AlertDialog"),
                    content:
                        Text("Are you sure you want to end the help request?"),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel')),
                      FlatButton(
                          onPressed: () => {endRequest()}, child: Text('Yes')),
                    ],
                  );
                });
          },
          child: const Text('Display nearest hospital:',
              style: TextStyle(fontSize: 20)),
        )
      ]));
    } else {
      return Center(
          child: Column(children: <Widget>[
        Card(
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: Container(
                  width: 300,
                  height: 100,
                  child: Text('Request status: on the way to the hospital'),
                ))),
        RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("AlertDialog"),
                    content: Text(
                        "Are you sure you want to show the nearest hospital?"),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel')),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showNearestHospital();
                          },
                          child: Text('Yes')),
                    ],
                  );
                });
          },
          child:
              const Text('End help request:', style: TextStyle(fontSize: 20)),
        )
      ]));
    }
  }

  void showNearestHospital() {
    setState(() {});
    InformationNavigation.arrivedAtEmergencyLocation = true;
  }

  void endRequest() {
    InformationNavigation.requestEnded = true;
  }
}
*/
