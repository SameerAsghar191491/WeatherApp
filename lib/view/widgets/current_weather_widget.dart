import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/resources/custom_colors.dart';
import 'package:weatherapp_starter_project/utils/Utils.dart';
import 'package:weatherapp_starter_project/view_model/get_location_&_weather_data_view_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final cwProvider = Provider.of<GetLocation_WeatherData_ViewModel>(
        context,
      );
      return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                // alignment: AlignmentGeometry.topLeft,
                height: 80,
                width: 80,
                "assets/weather/${cwProvider.weatherData.current!.weather![0].icon}.png",
              ),
              Container(height: 50, width: 1, color: CustomColors.dividerLine),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "${cwProvider.weatherData.current!.temp!.toInt().toString()}°",
                      style: const TextStyle(
                        fontSize: 68,
                        color: CustomColors.textColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: cwProvider.weatherData.current!.weather![0].main
                          .toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: CustomColors.textColorBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColors.cardColor,
                ),
                child: Image.asset("assets/icons/windspeed.png"),
              ),
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColors.cardColor,
                ),
                child: Image.asset("assets/icons/clouds.png"),
              ),
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColors.cardColor,
                ),
                child: Image.asset("assets/icons/humidity.png"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 20,
                width: 60,
                child: Text(
                  "${cwProvider.weatherData.current!.windSpeed!.toDouble()}km/h",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                height: 20,
                width: 60,
                child: Text(
                  "${cwProvider.weatherData.current!.clouds!.toInt()}%",

                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                height: 20,
                width: 60,
                child: Text(
                  "${cwProvider.weatherData.current!.humidity!.toInt()}%",

                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      );
    } catch (e) {
      debugPrint(e.toString());
      Utils.toastmessage(e.toString());
    }
    return Center(child: Text('No Data'));
  }
}
