import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_starter_project/resources/custom_colors.dart';
import 'package:weatherapp_starter_project/view_model/get_location_&_weather_data_view_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  DateTime dateTime = DateTime.now();
  // String date = DateFormat("YY-MM-DD").format(DateTime.now());
  String date = DateFormat("yMMMMd").format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final weatherdataVmProvider = Provider.of<GL_WD_ViewModel>(
      context,
      listen: false,
    );
    getAddress(
      weatherdataVmProvider.getlatitute,
      weatherdataVmProvider.getlongitude,
    );
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    print(placemark[0]);
    // print("lat: $lat, lon: $lon");
    setState(() {
      city = placemark[0].locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // color: Colors.amber,
          margin: EdgeInsets.only(left: 20, right: 20),
          // alignment: Alignment.topLeft,
          child: Text(
            city,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: CustomColors.textColorBlack,
            ),
          ),
        ),
        Container(
          // color: Colors.amber,
          margin: EdgeInsets.only(left: 20, right: 20),
          // alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
