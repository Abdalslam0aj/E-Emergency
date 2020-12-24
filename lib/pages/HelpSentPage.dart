import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:E_Emergency/widgets/SendHelpScreen/ConformationCard.dart';
import 'package:flutter/material.dart';

class HelpSentPage extends StatefulWidget {
  @override
  _HelpSentPageState createState() => _HelpSentPageState();
}

class _HelpSentPageState extends State<HelpSentPage> {
  String address;
  @override
  void initState() {
    // TODO: implement initState
     LocationFinder.getUserAddress().then((add){

         address=add;
          });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:ConformationCard(), ),
      
    );
  }
}