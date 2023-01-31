import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_flutter_app/services/location.dart';
import 'package:http/http.dart' as http;

import '../services/weather_model.dart';

const apiKey = '4b0e740606a6e3d318b40d77b6383f62';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    getData();
    print(location.latitude);
    print(location.longitude);
  }

  Future<WeatherModel?> getData() async {
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=4b0e740606a6e3d318b40d77b6383f62');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final data = response.body;
        final weatherModel = weatherModelFromJson(data);

        print(data);
        print(weatherModel);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}



      // body: Center(
      //   child: TextButton(
      //     onPressed: () {
      //       //Get the current location
      //       getLocation();
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ),
    
