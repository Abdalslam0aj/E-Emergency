import 'package:flutter/material.dart';

class RequestStatusUpdate extends StatelessWidget {
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
                child: Text('Request status: on the way'),
              ))),
      RaisedButton(
        onPressed: null,
        child: const Text('Display nearest hospital:',
            style: TextStyle(fontSize: 20)),
      )
    ]));
  }
}
