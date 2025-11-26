import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/view/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/view/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/view/widgets/hourly_weather_widget.dart';
import 'package:weatherapp_starter_project/view_model/get_location_&_weather_data_view_model.dart';

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
    final providerLocation = Provider.of<GetLocation_WeatherData_ViewModel>(
      context,
      listen: false,
    );
    if (providerLocation.getLoading) {
      providerLocation.getLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    debugPrint('build function called');
    // ignore: unused_local_variable
    // final weatherData_VM_provider = Provider.of<GetLocationViewModel>(
    //   context,
    //   listen: false,
    // );

    return Scaffold(
      body: SafeArea(
        child: Selector<GetLocation_WeatherData_ViewModel, bool>(
          selector: (_, provider) => provider.getLoading,
          builder: (context, value, child) {
            debugPrint('selector function called');
            return value
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(height: 20),
                        const HeaderWidget(),
                        SizedBox(height: 20),
                        const CurrentWeatherWidget(),
                        SizedBox(height: 20),
                        const HourlyWeatherWidget(),
                      ],
                    ),
                  );
          },
        ),
      ),
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
    
