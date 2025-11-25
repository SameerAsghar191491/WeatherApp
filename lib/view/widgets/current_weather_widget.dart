import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/utils/Utils.dart';
import 'package:weatherapp_starter_project/view_model/get_location_&_weather_data_view_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final CW_Provider =
          Provider.of<GetLocation_WeatherData_ViewModel>(context);
      return Row(
        children: [
          Image.asset(
            height: 80,
            width: 80,
            "assets/weather/${CW_Provider.weatherData.current!.weather![0].icon}.png",
          ),
        ],
      );
    } catch (e) {
      debugPrint(e.toString());
      Utils.toastmessage(e.toString());
    }
    return Container();
  }
}
