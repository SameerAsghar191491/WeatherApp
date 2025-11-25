import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:weatherapp_starter_project/api_response/weatherapiresonse.dart';
import 'package:weatherapp_starter_project/view/HomeScreen.dart';
import 'package:weatherapp_starter_project/view_model/get_location_&_weather_data_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => Weatherapiresonse()),
        ChangeNotifierProvider(
          create: (context) => GetLocation_WeatherData_ViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}
