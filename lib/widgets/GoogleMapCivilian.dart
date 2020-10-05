import 'package:E_Emergency/widgets/CivilianMainMenu.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class GoogleMaps extends StatelessWidget {
  static const double log=0.0;
  static const double lat=0.0; 
  
    

 GoogleMapController mapController;
  final LatLng _center =const LatLng(lat, log);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  // Marker f = Marker(markerId: MarkerId('1'),icon: BitmapDescriptor.defaultMarker, position: LatLng(23.025857, 72.543423));
 // Set<Marker> markers=[Marker(markerId: MarkerId('1'),icon: BitmapDescriptor.defaultMarker, position: LatLng(23.025857, 72.543423))] as Set<Marker>;
  
 
    
  void setLatLang(double lat,double log){
   
    CameraUpdate cameraUpdate =CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, log),zoom: 15));
    
    mapController.moveCamera(cameraUpdate);
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 300,
      width: 400,
      margin: EdgeInsets.all(10),
       child:
               GoogleMap(
               //  markers: markers,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,               
                zoom: 6,)),
       
      
    );
  }
}

class GooogleMapCivilian extends StatefulWidget {
  @override
  _GooogleMapCivilianState createState() => _GooogleMapCivilianState();
}

class _GooogleMapCivilianState extends State<GooogleMapCivilian> {
  GoogleMapController mapController;
  final LatLng _center =const LatLng(30.0, 30.0);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void setLatLang(double lat,double log){
     
    CameraUpdate cameraUpdate =CameraUpdate.newCameraPosition(CameraPosition(target: new LatLng(lat, log),zoom: 6));
    
    mapController.moveCamera(cameraUpdate);
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      margin: EdgeInsets.all(10),
       child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 6,))
      
    );
  }
}