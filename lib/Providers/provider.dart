// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:weather_app/Model/WeatherModel.dart';

class Weatherprovider extends ChangeNotifier {
  weatherModel? weatherData;
  set ChangeWeather(weatherModel? weather) {
    weatherData = weather;
    notifyListeners();
  }

  get getChangeWeather => weatherData;
}
