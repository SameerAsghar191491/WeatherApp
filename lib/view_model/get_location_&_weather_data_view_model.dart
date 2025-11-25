import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp_starter_project/data/app_exceptions.dart';
import 'package:weatherapp_starter_project/models/weather_data_model.dart';
import 'package:weatherapp_starter_project/repository/weather_data_api_call.dart';
import 'package:weatherapp_starter_project/utils/Utils.dart';

// ignore: camel_case_types
class GetLocation_WeatherData_ViewModel with ChangeNotifier {
  bool _loading = true;
  double _latitude = 0.0;
  double _longitude = 0.0;

  bool get getLoading => _loading;
  double get getlatitute => _latitude;
  double get getlongitude => _longitude;

  WeatherDataApiCall weatherDataApiCall = WeatherDataApiCall();

  WeatherDataModel weatherData = WeatherDataModel();

  void setWeatherDataintoModel(newValue) {
    weatherData = newValue;
  }

  void setloading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      Timer(Duration(seconds: 1), () {
        Utils.toastmessage('Location Not Enabled');
        setloading(false);
      });
      return LocationNotEnabledException("Location Not Enabled");
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
          // debugPrint("$_latitude");
          // debugPrint("$_longitude");
          weatherDataApiCall
              .getWeatherApiResponse(
                getlatitute.toString(),
                getlongitude.toString(),
              )
              .then((value) {
                setWeatherDataintoModel(value);
                setloading(false);
              });
        })
        .onError((error, stackTrace) {
          Utils.toastmessage(error.toString());
        });
  }
}
