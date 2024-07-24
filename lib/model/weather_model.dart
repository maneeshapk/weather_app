
class Weather {
  final dynamic cityname;
  final dynamic temperture;
  final dynamic tem_min;
  final dynamic tem_max;
  final dynamic wind;
  final dynamic humidity;
  final dynamic sea_lvl;
  final dynamic feels_like;

  Weather(
      {required this.cityname,
      required this.temperture,
      required this.tem_min,
      required this.tem_max,
      required this.wind,
      required this.humidity,
      required this.sea_lvl,
      required this.feels_like});

factory  Weather.fromMap(Map<String, dynamic> weatherMap) {
    return Weather(
        cityname: weatherMap["cityname"],
        temperture: weatherMap["temperture"],
        tem_min:weatherMap["tem_min"],
        tem_max: weatherMap["tem_max"],
        wind: weatherMap["wind"],
        humidity: weatherMap["humidity"],
        sea_lvl: weatherMap["sea_lvl"],
        feels_like: weatherMap["feels_like"],
        );}}
