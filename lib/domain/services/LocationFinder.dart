import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class LocationFinder {
  static getUserLocation() async {
      String _mylocation;
      LocationData myLocation;
      String error;
      Location location = new Location();
      try {
        myLocation = await location.getLocation();
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          error = 'please grant permission';
          print(error);
        }
        if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
          error = 'permission denied- please enable it from app settings';
          print(error);
        }
        myLocation = null;
      }
      _mylocation=myLocation.latitude.toString() +',' +myLocation.longitude.toString();
        return myLocation;
      }

      static getUserAddress() async {
         
         String _myAddress;
      
      LocationData myLocation;
      String error;
      Location location = new Location();
      try {
        myLocation = await location.getLocation();
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          error = 'please grant permission';
          print(error);
        }
        if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
          error = 'permission denied- please enable it from app settings';
          print(error);
        }
        myLocation = null;
       }
     
      final coordinates = new Coordinates(
          myLocation.latitude, myLocation.longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(
          coordinates);
      var first = addresses.first;
      
      _myAddress=' ${first.subLocality}, ${first.addressLine}';
    
        return _myAddress;
    }
  
}