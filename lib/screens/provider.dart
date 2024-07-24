import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kalavastha/model/weather_model.dart';
import 'package:http/http.dart' as http;
class WeatherProvider extends ChangeNotifier{
  List<Weather> location = [];

  List<Weather> get searchLocation => location;


  void getweather(String cityname) async {
    final response = await http
    
        .get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityname&apikey=59e6d86021f1500b29e146ec52d86f3f"));
    print("response: ${response.body}");
    final filmList = jsonDecode(response.body)["Search"];
    List<Weather> tempLocation = [];
    for (var weatherMap in filmList) {
      Weather weather = Weather.fromMap(weatherMap);
      tempLocation.add(weather);
    }
    location = tempLocation;
    notifyListeners(); 
  }
}

