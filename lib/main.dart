import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/api_response/weatherapiresonse.dart';
import 'package:weatherapp_starter_project/response_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Weatherapiresonse()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ResponseScreen(),
    );
  }
}
