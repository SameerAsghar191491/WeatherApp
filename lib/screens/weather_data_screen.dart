import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/api_response/weatherapiresonse.dart';
import 'package:weatherapp_starter_project/models/weather_data_model.dart';

class WeatherDataScreen extends StatelessWidget {
  const WeatherDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Weatherapiresonse>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather Data Screen'),
      ),
      body: FutureBuilder<WeatherDataModel>(
        future: provider.getWeatherApiResponse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellowAccent.shade400,
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent.shade400,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(title: Text(snapshot.data!.current!.temp.toString()));
              },
            );
          }
        },
      ),
    );
  }
}
