import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp_starter_project/utils/Utils.dart';

class WeatherDataViewModel with ChangeNotifier {
  bool _loading = true;
  double _latitude = 0.0;
  double _longitude = 0.0;

  bool get getLoading => _loading;
  double get getlatitute => _latitude;
  double get getlongitude => _longitude;

  void setloading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("Location Not Enabled");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location Permission are denied Forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    // getting the currentPosition
    return await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
        )
        .then((value) {
          _latitude = value.latitude;
          _longitude = value.longitude;
          setloading(false);
        })
        .onError((error, stackTrace) {
          Utils.toastmessage(error.toString());
        });
  }
}
