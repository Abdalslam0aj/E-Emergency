import 'package:flutter/services.dart';
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
}