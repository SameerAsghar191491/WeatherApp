import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/api_response/weatherapiresonse.dart';
import 'package:weatherapp_starter_project/view_model/weather_data_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final providerLocation = Provider.of<WeatherDataViewModel>(context, listen: false);
    if (providerLocation.getLoading) {
    providerLocation.getLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final provider = Provider.of<Weatherapiresonse>(context, listen: false);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Weather App')),
      body: Container(),
    );
  }
}

// the program i first cretaed to test result of api response 

// FutureBuilder<WeatherDataModel>(
//         future: provider.getWeatherApiResponse(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Colors.yellowAccent.shade400,
//               ),
//             );
//           } else if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Colors.redAccent.shade400,
//               ),
//             );
//           } else {
//             return Center(
//               child: ListView.builder(
//                 itemCount: 1,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(snapshot.data!.current!.temp.toString()),
//                       Text(snapshot.data!.current!.windSpeed.toString()),
//                       Text(snapshot.data!.current!.humidity.toString()),
//                       Text(
//                         snapshot.data!.current!.weather![index].main.toString(),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             );
//           }
//         },
//       ),
    
