import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/resources/custom_colors.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      // margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(
            "Today",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey.shade700,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  color: CustomColors.cardColor,
                  height: 100,
                  width: 50,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
