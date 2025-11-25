import 'package:flutter/widgets.dart';
import 'package:weatherapp_starter_project/data/app_exceptions.dart';
import 'package:weatherapp_starter_project/data/network/base_api_services.dart';
import 'package:weatherapp_starter_project/data/network/network_api_services.dart';
import 'package:weatherapp_starter_project/repository/api_endpoints.dart';
import 'package:weatherapp_starter_project/models/weather_data_model.dart';
import 'package:weatherapp_starter_project/utils/Utils.dart';

class WeatherDataApiCall {
  BaseApiServices apiServices = NetworkApiServices();

  Future<WeatherDataModel> getWeatherApiResponse(String lat, String lon) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(getUrl(lat, lon));
      return response = WeatherDataModel.fromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      Utils.toastmessage(e.toString());
      throw FetchDataException(e.toString());
      // return null;
    }
  }

  String getUrl(lat, lon) {
    String url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&exclude=minutely&units=metric";
    return url;
  }
}
