import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/resources/custom_colors.dart';
import 'package:weatherapp_starter_project/view_model/get_location_&_weather_data_view_model.dart';

class ConfortLevelWidget extends StatelessWidget {
  const ConfortLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CLProvider = Provider.of<GL_WD_ViewModel>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.all(15),
      // color: Colors.amber,
      height: 270,
      width: 300,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "Comfort Level",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: CLProvider.apiResponse.data!.current!.humidity!
                .round()
                .toDouble(),
            appearance: CircularSliderAppearance(
              animationEnabled: true,
              infoProperties: InfoProperties(
                bottomLabelText: 'Humidity',
                bottomLabelStyle: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              customColors: CustomSliderColors(
                trackColors: [
                  CustomColors.firstGradientColor.withAlpha(150),
                  CustomColors.secondGradientColor.withAlpha(150),
                ],
                progressBarColors: [
                  CustomColors.firstGradientColor,
                  CustomColors.secondGradientColor,
                ],
                hideShadow: true,
                dotColor: CustomColors.firstGradientColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Feels Like ${CLProvider.apiResponse.data!.current!.feels_like.toString()}",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Container(height: 20, width: 1, color: CustomColors.dividerLine),
              Text(
                "Uv Index ${CLProvider.apiResponse.data!.current!.uvi.toString()}",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
