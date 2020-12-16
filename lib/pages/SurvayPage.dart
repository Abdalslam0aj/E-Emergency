import 'package:E_Emergency/widgets/SurvayWdigets/SurvayButton.dart';
import 'package:flutter/material.dart';

class SurvayPage extends StatefulWidget {
  @override
  _SurvayPageState createState() => _SurvayPageState();
}

class _SurvayPageState extends State<SurvayPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SurvayButton(buttonText: 'Wonded/fracuter',buttonImge: 'assets/wound.png',),
                      SurvayButton(buttonText: 'Chest/Heart\nPain',buttonImge: 'assets/wound.png',),
                      SurvayButton(buttonText: 'Poisoning\nDrug overdose',buttonImge: 'assets/wound.png',)
                    ],
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SurvayButton(buttonText: 'Car Accident',buttonImge: 'assets/wound.png',),
                      SurvayButton(buttonText: 'Wonded/fracuter',buttonImge: 'assets/wound.png',),
                      SurvayButton(buttonText: 'Wonded/fracuter',buttonImge: 'assets/wound.png',)
                    ],
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SurvayButton(buttonText: 'Wonded/fracuter',buttonImge: 'assets/wound.png',),
                      SurvayButton(buttonText: 'Wonded/fracuter',buttonImge: 'assets/wound.png',),
                      SurvayButton(buttonText: 'Wonded/fracuter',buttonImge: 'assets/wound.png',)
                    ],
                    
                  )
                ],
              )
            ],
          ) ,
      
        )
      )
    );
  }
}