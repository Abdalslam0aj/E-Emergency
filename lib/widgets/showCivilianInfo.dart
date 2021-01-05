import 'package:flutter/material.dart';

import 'Classes/helpRequest.dart';

// ignore: must_be_immutable
class CivlianInformation extends StatelessWidget {
  HelpRequest helpRequest;

  @override
  CivlianInformation(this.helpRequest);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Container(
            width: 300,
            height: 100,
            child: Text('Civilian phone number: ' +
                helpRequest.civilianPhoneNumber.toString()),
          ),
        ),
      ),
      Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Container(
            width: 300,
            height: 100,
            child: Text('description: ' + helpRequest.description),
          ),
        ),
      ),
      Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Container(
            width: 300,
            height: 100,
            child: Text(
                'Number of humans: ' + helpRequest.numberOfHumans.toString()),
          ),
        ),
      )
    ]));
  }
}
