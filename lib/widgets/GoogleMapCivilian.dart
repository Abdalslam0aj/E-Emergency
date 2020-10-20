import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'LocationFinder.dart';
  // Marker f = Marker(markerId: MarkerId('1'),icon: BitmapDescriptor.defaultMarker, position: LatLng(23.025857, 72.543423));
 // Set<Marker> markers=[Marker(markerId: MarkerId('1'),icon: BitmapDescriptor.defaultMarker, position: LatLng(23.025857, 72.543423))] as Set<Marker>;
  
class GooogleMapCivilian extends StatefulWidget {

  @override
  _GooogleMapCivilianState createState() => _GooogleMapCivilianState();
   
  
}

class _GooogleMapCivilianState extends State<GooogleMapCivilian> {
  GoogleMapController mapController;
  
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; 
  LocationData myLocation;
  final LatLng _center =const LatLng(31.9, 35.8);
  
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;       
  }
 void setLatLang(double lat,double log) {     
    CameraUpdate cameraUpdate =CameraUpdate.newCameraPosition(CameraPosition(target: new LatLng(lat, log),zoom: 15));  
    mapController.moveCamera(cameraUpdate); 
    
  } 
   setL() {
         
        LocationFinder.getUserLocation().then((location) {
      CameraUpdate cameraUpdate =CameraUpdate.newCameraPosition(CameraPosition(target: new LatLng(location.latitude,location.longitude),zoom: 15));
      print(cameraUpdate);  
       mapController.moveCamera(cameraUpdate); 
        });
    
  }  
  _GooogleMapCivilianState();

    @override
  void initState() {  
    super.initState(); 
     _add();
  }    
  

     void _add() {
        
     LatLng la;
     LocationFinder.getUserAddress().then((address){      

     LocationFinder.getUserLocation().then((location) {
        la=LatLng(location.latitude, location.longitude);
         myLocation=location;      
        var markerIdVal ='Your location';
        final MarkerId markerId = MarkerId(markerIdVal);
        final Marker marker = Marker(
          markerId: markerId,
          position: la,
          infoWindow: InfoWindow(title: markerIdVal, snippet:address),      
          onTap: () { });
              
       setState(() {          
        markers[markerId] = marker;
           
        setL();      
      });
    });
    });
    
     
   }
   


  @override
  Widget build(BuildContext context) {
    
    return Card(
      margin: EdgeInsets.all(5),
      shadowColor: Colors.red,
      color: Colors.blue,
          child: Container(
        height: MediaQuery.of(context).size.height*0.48,
        width: MediaQuery.of(context).size.height*0.95,
        margin: EdgeInsets.all(10),
         child:        
             GoogleMap(             
               markers: Set<Marker>.of(markers.values),
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 6,)),        
         
        
      ),
    );
  }
}