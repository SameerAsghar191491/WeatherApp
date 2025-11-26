import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/resources/custom_colors.dart';
import 'package:weatherapp_starter_project/view_model/get_location_&_weather_data_view_model.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final hwProvider = Provider.of<GL_WD_ViewModel>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final hourlyWeatherLength = hwProvider.weatherData.hourly!.length > 12
        ? 12
        : hwProvider.weatherData.hourly!.length;
    return Container(
      height: height * .22,
      // color: Colors.amber,
      // margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            "Today",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Selector<GL_WD_ViewModel, int>(
              selector: (_, provider) => provider.selectedContainer,
              builder: (context, value, child) {
                print("selector function called");
                return ListView.builder(
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: hourlyWeatherLength,
                  itemBuilder: (context, index) {
                    final timeStamp = hwProvider.weatherData.hourly![index].dt;
                    // final selectedIndex = selectedContainer(index);
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        onTap: () {
                          hwProvider.selectContainer(index);
                          print(index + 1);
                        },
                        child: Container(
                          // height: height * 0.1,
                          // color: Colors.amber,
                          width: width * 0.22,
                          decoration: BoxDecoration(
                            gradient: value == index
                                ? LinearGradient(
                                    colors: [
                                      CustomColors.firstGradientColor,
                                      const Color.fromARGB(255, 105, 161, 241),
                                    ],
                                  )
                                : null,
                            color: value == index
                                ? null
                                : CustomColors.cardColor,
                            // boxShadow: [
                            //   value == index
                            //       ? BoxShadow(
                            //           offset: const Offset(10, 0),
                            //           blurRadius: 30,
                            //           spreadRadius: 1,
                            //           // color: CustomColors.dividerLine.withAlpha(
                            //           //   150,
                            //           // ),
                            //           color: Colors.white,
                            //         )
                            //       : BoxShadow(),
                            // ],
                            // color: CustomColors.cardColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                getTime(timeStamp),
                                style: TextStyle(
                                  color: value == index
                                      ? Colors.white
                                      : CustomColors.textColorBlack,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Image.asset(
                                height: height * 0.05,
                                // width: width * 0.12,
                                "assets/weather/${hwProvider.weatherData.hourly![index].weather![0].icon.toString()}.png",
                                // fit: BoxFit.cover,
                              ),
                              Text(
                                "${hwProvider.weatherData.hourly![index].temp!.toInt().toString()}°",
                                style: TextStyle(
                                  color: value == index
                                      ? Colors.white
                                      : CustomColors.textColorBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat("jm").format(time);
    return x;
  }
}
