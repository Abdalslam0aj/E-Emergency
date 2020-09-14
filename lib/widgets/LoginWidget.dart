import 'package:flutter/material.dart';


class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Enter your phone number'),
          TextField(
            decoration: InputDecoration(labelText: 'phoneNumber'),
            keyboardType: TextInputType.phone,
            )
         ]),
    );
  }
}