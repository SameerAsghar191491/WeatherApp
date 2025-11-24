import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/view/HomeScreen.dart';

class ResponseScreen extends StatelessWidget {
  const ResponseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Response')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: Size(100, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: const Center(child: Text('Tap')),
        ),
      ),
    );
  }
}
