import 'package:E_Emergency/domain/Timer.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  AnimationController controller;
  Function canselHelpRequest;
  CountDownTimer(this.controller,this.canselHelpRequest);
  
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
      AnimationController controller;
    

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inSeconds}';
  }

  @override
  void initState() {
    super.initState();
    
   widget.controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
     controller=widget.controller;
     controller.reverse( from: controller.value == 0.0
                          ? 1.0
                          : controller.value);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white10,
      body:
      AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.red,
                    height:
                        controller.value * MediaQuery.of(context).size.height,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                      painter: CustomTimerPainter(
                                        animation: controller,
                                        backgroundColor: Colors.white,
                                        color: themeData.indicatorColor,
                                      )),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Sending Emergency Help Request in",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: 112.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return FloatingActionButton.extended(
                                onPressed: () {   
                                  widget.canselHelpRequest();                          
                                },
                                icon: Icon(Icons.cancel),                                    
                                label: Text("cansel"));
                          }),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}