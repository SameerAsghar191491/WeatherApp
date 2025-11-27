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
    final dailyWeatherLength = dwProvider.apiResponse.data!.daily!.length > 7
        ? 7
        : dwProvider.apiResponse.data!.daily!.length;
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
                final stamp = dwProvider.apiResponse.data!.daily![index].dt;
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // color: Colors.amber,
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 30,
                            // color: Colors.amber,
                            child: Text(
                              getDay(stamp),
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            height: 30,
                            width: 30,
                            "assets/weather/${dwProvider.apiResponse.data!.daily![index].weather![0].icon}.png",
                          ),
                          // SizedBox(width: 10),
                          SizedBox(
                            height: 20,
                            width: 50,
                            // color: Colors.amber,
                            child: Text(
                              "${dwProvider.apiResponse.data!.daily![index].temp!.max!.toInt()}°/${dwProvider.apiResponse.data!.daily![index].temp!.min!.toInt()}",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
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
