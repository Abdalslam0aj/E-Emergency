import 'package:flutter/material.dart';

import 'dart:async';

import 'Classes/apiRequest.dart';
import 'Classes/helpRequest.dart';
import 'informationNavigation.dart';

//void main() => runApp(ShowComingRequest());

// ignore: must_be_immutable
class ParamedicMainMenu extends StatefulWidget {
  ParamedicMainMenu({Key key}) : super(key: key);
  _IncomingEmergencyRequest createState() => _IncomingEmergencyRequest();
}

class _IncomingEmergencyRequest extends State<ParamedicMainMenu> {
  static const String _title = 'Incoming Emergency Request';
  //_IncomingEmergencyRequest({Key key}) : super(key: key);
  Future<HelpRequest> helpRequest;
  void initState() {
    super.initState();
    helpRequest = ApiRequests().fetchHelpRequest();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: Scaffold(
            appBar: AppBar(title: const Text(_title)),
            body: Center(
              child: Card(
                child: FutureBuilder<HelpRequest>(
                  future: helpRequest,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.notification_important),
                            title: Text(
                                'You have been assigned to an emergency situation!'),
                            subtitle: Text(snapshot.data.description),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('SHOW DETAILS'),
                                onPressed: goToHelpRequestInfoPage(
                                    context, snapshot.data),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
              ),
            )));
  }

  goToHelpRequestInfoPage(BuildContext context, HelpRequest hr) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => InformationNavigation(hr)));
  }
}
