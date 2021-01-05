import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Classes/assignedHelpRequest.dart';

//const String URL = "https://192.168.1.31:44390/ReciveHelpRequest";
//void main() => runApp(MyApp());

class HelpLocation extends StatefulWidget {
  HelpLocation({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HelpLocation> {
  _MyAppState();
  Completer<GoogleMapController> _controller = Completer();

  void initState() {
    super.initState();
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

  //LatLng _l1;
  LatLng locationOfEmergency = LatLng(
      AssignedHelpRequest.assignedHelpRequest.latitude,
      AssignedHelpRequest.assignedHelpRequest.longitude);

  void _onMapCreated(GoogleMapController controller) {
    print(locationOfEmergency);
    _center = locationOfEmergency;
    _lastMapPosition = _center;
    //  _l1 = _center;
    _controller.complete(controller);
    _createMarkers();
    _createPolyLines(
      PointLatLng(31.981340, 35.839020),
      PointLatLng(AssignedHelpRequest.assignedHelpRequest.latitude,
          AssignedHelpRequest.assignedHelpRequest.longitude),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        'AIzaSyDP-Tm7tTT69M5hxxJy0fY-aTzyFSajJ1Q', start, destination,
        travelMode: TravelMode.transit);
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
