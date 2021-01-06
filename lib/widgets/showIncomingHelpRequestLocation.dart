import 'dart:async';

import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Classes/assignedHelpRequest.dart';

class HelpLocation extends StatefulWidget {
  //LatLng locationOfEmergency;
  //HelpLocation(this.locationOfEmergency);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HelpLocation> {
  Completer<GoogleMapController> _controller = Completer();
  String googleAPIKey = 'AIzaSyDP-Tm7tTT69M5hxxJy0fY-aTzyFSajJ1Q';
  final Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  LatLng _lastMapPosition;
  LatLng _l2 = LatLng(31.981340, 35.839020);
  List<LatLng> latlng = List();
  static const LatLng _center = const LatLng(32.017509, 35.890251);
  LatLng _l1 = _center;

  @override
  void initState() {
    super.initState();
    setIcons();
  }

  void setIcons()  {
    sourceIcon =  BitmapDescriptor.defaultMarker;
    destinationIcon =  BitmapDescriptor.defaultMarker;
  }

  // LatLng _l2 = LatLng(31.981340, 35.839020);
  // LatLng _center;
  void _onMapCreated(GoogleMapController controller) {
    //_center = locationOfEmergency;

    _controller.complete(controller);

    latlng.add(_l1);
    latlng.add(_l2);
    setMapPins();
    setPolylines();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Emergency Location'),
              backgroundColor: Colors.blue[300],
            ),
            backgroundColor: Colors.black,
            body: GoogleMap(
              //that needs a list<Polyline>

              markers: _markers,
              polylines: _polylines,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              //onCameraMove: _onCameraMove,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),

              mapType: MapType.normal,
            )));
  }

  void setMapPins() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'), position: _l1, icon: sourceIcon));
      _markers.add(Marker(
          markerId: MarkerId('destPin'), position: _l1, icon: destinationIcon));
    });
  }

  setPolylines() async {
    PolylineResult result =
        (await polylinePoints?.getRouteBetweenCoordinates(
            googleAPIKey,
            PointLatLng(_l1.latitude, _l1.longitude),
            PointLatLng(_l2.latitude, _l2.longitude)));

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
}


//const String URL = "https://192.168.1.31:44390/ReciveHelpRequest";
//void main() => runApp(MyApp());
/*
class HelpLocation extends StatefulWidget {
  HelpRequest helpRequest;
  HelpLocation(this.helpRequest,);//{Key key}) : super(key: key);
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HelpLocation> {
  _MyAppState();
  Completer<GoogleMapController> _controller = Completer();
  HelpRequest help=new HelpRequest();
  
  @override
  void initState() {
    super.initState();
   help=widget.helpRequest;   
   print(help.latitude.toString()+'ssdsss222sd');
   setState(() {
      locationOfEmergency = LatLng(
      help.latitude,
      help.longitude);
       print(locationOfEmergency.latitude.toString()+'ssdsd');
    });
     print(locationOfEmergency.latitude);
  }

  //static const LatLng _center = const LatLng(32.017509, 35.890251);
  LatLng _center = LatLng(31.981340, 35.839020);
  final Set<Marker> _markers = {};
  //final Set<Polyline> _polyline = {};
  PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  LatLng _lastMapPosition;
  LatLng _l2 = LatLng(31.981340, 35.839020);
  List<LatLng> latlng = List();
 LatLng locationOfEmergency ;
  //LatLng _l1;
  
  

  void _onMapCreated(GoogleMapController controller) {
     print(help.latitude.toString()+'ssdsss333sd');
    setState(() {
      locationOfEmergency = LatLng(
      help.latitude,
      help.longitude);
    });
   
    print(locationOfEmergency);
    _center = locationOfEmergency;
    _lastMapPosition = _center;
    //  _l1 = _center;
    _controller.complete(controller);
    _createMarkers();
    _createPolyLines(
      PointLatLng(31.981340, 35.839020),
      PointLatLng(help.latitude,
      help.longitude),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(locationOfEmergency.latitude.toString()+'ssdsd');
    return locationOfEmergency == null
        ? Container()
        : Container(
            child: Scaffold(
                backgroundColor: Colors.black,
                body: GoogleMap(
                  //that needs a list<Polyline>
                  polylines: Set<Polyline>.of(polylines.values),
                  markers: _markers,
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  //onCameraMove: _onCameraMove,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 12.0,
                  ),

                  mapType: MapType.normal,
                )),
          );
  }

  /*Future<String> getHelpRequestInfo() async {
    http.Response response = await http.get(Uri.encodeFull("url here"),
        headers: {"Accept": "application/json"});

    List helpRequestInfoList = jsonDecode(response.body);
    print(helpRequestInfoList[1]["civilianPhoneNumber"]);
  }*/

  _createPolyLines(PointLatLng start, PointLatLng destination) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyDa7ifKIOyGpc4AJugDeoNyxZIXzyjkSEY', start, destination,
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      PolylineId id = PolylineId('poly');
      Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates,
        width: 3,
      );
      polylines[id] = polyline;
    } else {
      print('nothing here');
    }
  }

  _createMarkers() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Emergency Location',
          snippet: 'Emergency',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId(_l2.toString()),
        position: _l2,
        infoWindow: InfoWindow(
          title: 'You',
          snippet: 'Your location',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(1),
      ));
    });
  }
}
*/