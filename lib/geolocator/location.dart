// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:kalavastha/geolocator/api.dart';
import 'package:kalavastha/model/weather_model.dart';

getweather( String cityname) async {
    var p = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      forceAndroidLocationManager: true,
    );
    if (p != null) {
      print("user latitude: ${p.latitude}");
      print("user longitude: ${p.longitude}");
    } 
    else {
      print("error");
    }
    var url;
    if(cityname==""){
    url="https://api.openweathermap.org/data/2.5/weather?lat=${p.latitude}&lon=${p.longitude}&appid=59e6d86021f1500b29e146ec52d86f3f";
    }
    else{
  url="https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey";
    }

  final response=await http.get(Uri.parse(url));
  print(response.body);
  

  final findweather=jsonDecode(response.body);
  Weather getweather=Weather(cityname: findweather["name"], temperture: findweather["main"]["temp"], tem_min: findweather["main"]["temp_min"], tem_max: findweather["main"]["temp_max"], wind: findweather["main"]["wind"], humidity: findweather["main"]["humidity"], sea_lvl: findweather["main"]["sea_level"], feels_like: findweather["main"]["feels_like"]);
 return getweather;
  
}