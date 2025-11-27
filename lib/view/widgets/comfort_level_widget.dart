import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/resources/custom_colors.dart';
import 'package:weatherapp_starter_project/view_model/get_location_&_weather_data_view_model.dart';

class ComfortLevelWidget extends StatelessWidget {
  const ComfortLevelWidget({super.key});

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
              size: 140,
              animationEnabled: true,
              infoProperties: InfoProperties(
                mainLabelStyle: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                ),
                bottomLabelText: 'Humidity',
                bottomLabelStyle: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              customColors: CustomSliderColors(
                trackColor: CustomColors.firstGradientColor.withAlpha(100),
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
