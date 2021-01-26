import 'dart:async';

import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/widgets/Classes/apiRequest.dart';
import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:E_Emergency/widgets/informationNavigation.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('object/////////////////////////////////////');
    helpRequest = EEWebService().getRequest('0795862772');
    print('Running/////////////////////////////////////');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            onPressed:
                                goToHelpRequestInfoPage(context, snapshot.data),
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
        ));
  }

  goToHelpRequestInfoPage(BuildContext context, HelpRequest hr) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => InformationNavigation(hr)));
  }
}
