import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/data/status/status.dart';
import 'package:weatherapp_starter_project/resources/custom_colors.dart';
import 'package:weatherapp_starter_project/view/widgets/comfort_level_widget.dart';
import 'package:weatherapp_starter_project/view/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/view/widgets/daily_weather_widget.dart';
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
    final providerLocation = Provider.of<GL_WD_ViewModel>(
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
    // final WDVMProvider = Provider.of<GL_WD_ViewModel>(
    //   context,
    //   listen: false,
    // );

    return Scaffold(
      body: SafeArea(
        child: Selector<GL_WD_ViewModel, Status>(
          selector: (_, provider) => provider.apiResponse.status!,
          builder: (context, value, child) {
            debugPrint('selector function called');
            switch (value) {
              case Status.LOADING:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/clouds.png",
                        height: 120,
                        width: 120,
                      ),
                      SizedBox(height: 20),
                      CircularProgressIndicator(
                        color: CustomColors.firstGradientColor,
                      ),
                    ],
                  ),
                );
              case Status.ERROR:
                return Center(
                  // child: Text(context.read<GL_WD_ViewModel>().apiResponse.message.toString()),
                  child: Text("Something Is Wrong"),
                );
              case Status.COMPLETED:
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 20),
                    // Container(
                    // color: Colors.amber,
                    // child:
                    const HeaderWidget(),
                    // ),
                    SizedBox(height: 20),
                    // Container(
                    // color: Colors.amber,
                    // child:
                    const CurrentWeatherWidget(),
                    // ),
                    SizedBox(height: 20),
                    // Container(
                    // color: Colors.amber,
                    // child:
                    const HourlyWeatherWidget(),
                    SizedBox(height: 20),
                    // ),
                    // Container(
                    // color: Colors.amber,
                    // child:
                    const DailyWeatherWidget(),
                    // ),
                    // Container(
                    // color: Colors.amber,
                    // child:
                    const ComfortLevelWidget(),
                  ],
                );
              // return Center(child: Container(child: Text("Done")));
            }
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
    
