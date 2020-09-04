import 'package:flutter/material.dart';

import '../services/location.dart';
import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.lat;
    lon = location.lon;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=41113964a80b843fafb36d9221cc49f2');

    var weatherData = await networkHelper.getData();
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
