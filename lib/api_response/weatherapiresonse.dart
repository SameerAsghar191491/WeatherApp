import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/api_endpoints.dart';
import 'package:weatherapp_starter_project/models/weather_data_model.dart';

class Weatherapiresonse with ChangeNotifier {
  Future<WeatherDataModel> getWeatherApiResponse() async {
    try {
      final response = await http.get(Uri.parse(ApiEndpoints.weatherapi));

      var body = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        debugPrint('api call successfull');
        notifyListeners();
        return WeatherDataModel.fromJson(body);
      } else {
        debugPrint('Response is not 200');
        notifyListeners();
        return WeatherDataModel.fromJson(body);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
      // return null;
    }
  }
}
