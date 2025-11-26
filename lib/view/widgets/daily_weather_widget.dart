import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/resources/custom_colors.dart';
import 'package:weatherapp_starter_project/view_model/get_location_&_weather_data_view_model.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dwProvider = Provider.of<GL_WD_ViewModel>(context);
    final dailyWeatherLength = dwProvider.weatherData.daily!.length > 7
        ? 7
        : dwProvider.weatherData.daily!.length;
    return Container(
      height: 400,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Next Days",
              style: TextStyle(
                color: CustomColors.textColorBlack,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dailyWeatherLength,
              itemBuilder: (context, index) {
                final stamp = dwProvider.weatherData.daily![index].dt;
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(getDay(stamp)),
                          SizedBox(width: 20),
                          Image.asset(
                            height: 30,
                            width: 30,
                            "assets/weather/${dwProvider.weatherData.daily![index].weather![0].icon}.png",
                          ),
                          SizedBox(width: 10),
                          Text("Hello"),
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      width: 450,
                      color: CustomColors.dividerLine,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String getDay(final stamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(stamp * 1000);
    String day = DateFormat("EEE").format(dateTime);
    return day;
  }
}
