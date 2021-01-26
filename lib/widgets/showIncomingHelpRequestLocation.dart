import 'dart:async';

import 'package:E_Emergency/classes/TravelTime.dart';
import 'package:E_Emergency/data/webservice/EEWebService.dart';
import 'package:E_Emergency/domain/services/LocationFinder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'Classes/helpRequest.dart';

// ignore: must_be_immutable
class HelpLocation extends StatefulWidget {
  double civilianLatitude, civilianLongitude;
  HelpLocation(this.civilianLatitude, this.civilianLongitude);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HelpLocation> {
  Future<TT> time1;
  LocationData paramedicLocation;
  Future<LocationData> coordinates;
  Completer<GoogleMapController> _controller = Completer();
  String googleAPIKey = 'AIzaSyDP-Tm7tTT69M5hxxJy0fY-aTzyFSajJ1Q';
  LatLng locationOfEmergency;
  final Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  List<LatLng> latlng = List();
  HelpRequest hr;
  EEWebService paramedicService = new EEWebService();
  @override
  void initState() {
    locationOfEmergency =
        LatLng(widget.civilianLatitude, widget.civilianLongitude);

    super.initState();
    setIcons();
  }

  void setIcons() {
    // BitmapDescriptor.fromAssetImage(
    //       ImageConfiguration(size: Size(14, 14)), 'assets/ambulance.png')
    // .then((onValue) {
    //sourceIcon = onValue;
    //});
    sourceIcon = BitmapDescriptor.defaultMarker;
    destinationIcon = BitmapDescriptor.defaultMarker;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    latlng.add(locationOfEmergency);
    setMapPins();
    setPolylines();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(children: [
      GoogleMap(
        markers: _markers,
        polylines: _polylines,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: locationOfEmergency,
          zoom: 11.0,
        ),
        mapType: MapType.normal,
      ),
      AnimatedPositioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Align(
            alignment: Alignment(0.0, -0.7),
            child: ExpansionTile(
              backgroundColor: Colors.white,
              title: Text('Travel Information',
                  style: TextStyle(fontSize: 13, color: Colors.blue)),
              children: <Widget>[travelTimeCard()],
            ),
          ),
          duration: Duration(milliseconds: 200))
    ]));
  }

  void setMapPins() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: locationOfEmergency,
          icon: sourceIcon));
      _markers.add(Marker(
          markerId: MarkerId('destPin'),
          position: locationOfEmergency,
          icon: destinationIcon));
    });
  }

  String emergencyLocation;

  setPolylines() async {
    paramedicLocation = await LocationFinder.getUserLocation();
    emergencyLocation = await LocationFinder.getEmergencyAddress(
        locationOfEmergency.latitude, locationOfEmergency.longitude);
    //  paramedicLocation.latitude = 32.017509;
    //paramedicLocation.longitude = 35.890251;

    time1 = paramedicService.getTime(
        paramedicLocation.latitude,
        paramedicLocation.longitude,
        locationOfEmergency.latitude,
        locationOfEmergency.longitude);

    latlng.add(LatLng(paramedicLocation.latitude, paramedicLocation.longitude));
    latlng.add(locationOfEmergency);
    PolylineResult result = (await polylinePoints?.getRouteBetweenCoordinates(
        googleAPIKey,
        PointLatLng(paramedicLocation.latitude, paramedicLocation.latitude),
        PointLatLng(
            locationOfEmergency.latitude, locationOfEmergency.longitude)));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      Polyline polyline = Polyline(
          polylineId: PolylineId('poly'),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);
      _polylines.add(polyline);
    });
  }

  Widget travelTimeCard() {
    return Container(
        margin: EdgeInsets.all(20),
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 20,
                  offset: Offset.zero,
                  color: Colors.grey.withOpacity(0.5))
            ]),
        child: FutureBuilder<TT>(
            future: time1,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Emergency Location:$emergencyLocation',
                              style: TextStyle(fontSize: 13),
                            ),
                            tta()
                          ]),
                    ))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
                //return Text("not pog");
              }
              return CircularProgressIndicator();
            }));
  }

  Widget tta() {
    return FutureBuilder<TT>(
        future: time1,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              'Estimated Duration: ${snapshot.data.time.toString().substring(0, 2)} minutes',
              style: TextStyle(fontSize: 13, color: Colors.blue),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
            //return Text("not pog");
          }
          return Text(
            'Estimated Duration: ...',
            style: TextStyle(fontSize: 13, color: Colors.blue),
          );
        });
  }
}
