// ignore_for_file: non_constant_identifier_names, file_names, camel_case_types, unused_label, unnecessary_question_mark

import 'package:flutter/material.dart';

class weatherModel {
  String CityName;
  String Location;
  String Date;
  double Temp;
  double MaxTemp;
  double MinTemp;
  String StateWeather;
  String Icons;
  String? Not;

  weatherModel(
      {required this.CityName,
      required this.Location,
      required this.Date,
      required this.Temp,
      required this.MaxTemp,
      required this.MinTemp,
      required this.StateWeather,
      required this.Icons,
      this.Not});
  factory weatherModel.fromJson(dynamic? Data) {
    try {
      var JsonData = Data?['forecast']?['forecastday']?[0]?['day'];
      return weatherModel(
          CityName: Data?['location']?['name'] ?? '',
          Location: Data?['location']?['country'] ?? '',
          Date: Data?['location']?['localtime'] ?? '',
          Temp: JsonData?['avgtemp_c'] ?? 0,
          MaxTemp: JsonData?['maxtemp_c'] ?? 0,
          MinTemp: JsonData?['mintemp_c'] ?? 0,
          StateWeather: Data?['current']?['condition']?['text'] ?? '',
          Icons: Data?['current']?['condition']?['icon'] ?? '',
          Not: Data?['error']?['message'] ?? " ");
    } catch (e) {
      print(e);
      throw Exception(e);
    }

    // String get AImage {
    //   if (StateWeather == 'Sandstorm' ||
    //       StateWeather == 'Duststorm' ||
    //       StateWeather == 'Sand' ||
    //       StateWeather == 'Dust') {
    //     return 'assets/images/icons8-duststorm-48.png';
    //   } else if (StateWeather == 'Sunny') {
    //     return 'assets/images/icons8-sun-50.png';
    //   } else if (StateWeather == 'Clearing' ||
    //       StateWeather == 'Fair' ||
    //       StateWeather == 'Audio' ||
    //       StateWeather == 'Fine') {
    //     return 'assets/images/moon.png';
    //   } else if (StateWeather == 'Fog' || StateWeather == 'Haze') {
    //     return 'assets/images/icons8-fog-62.png';
    //   } else if (StateWeather == 'Hot') {
    //     return 'assets/images/icons8-hot-40.png';
    //   } else {
    //     return 'assets/images/icons8-insect-50.png';
    //   }
    // }
  }
  MaterialColor ACOlors() {
    if (StateWeather == 'Sandstorm' ||
        StateWeather == 'Duststorm' ||
        StateWeather == 'Sand' ||
        StateWeather == 'Dust' ||
        StateWeather == 'Sunny' ||
        StateWeather == 'Clearing' ||
        StateWeather == 'Fair' ||
        StateWeather == 'Fine' ||
        StateWeather == 'Fog' ||
        StateWeather == 'Haze' ||
        StateWeather == 'Cloudy' ||
        StateWeather == 'Hot') {
      return Colors.orange;
    }
    return Colors.blueGrey;
  }
// else {
//       StateWeather == 'Thunderstorms' ||
//           StateWeather == 'Storm' ||
//           StateWeather == 'Lightning' ||
//           StateWeather == 'Thunder ' ||
//           StateWeather == 'Cool' ||
//           StateWeather == 'Cold' ||
//           StateWeather == 'Windy' ||
//           StateWeather == 'Gale' ||
//           StateWeather == 'Partly Cloudy' ||
//           StateWeather == 'Partly cloudy' ||
//           StateWeather == 'Partly Bright' ||
//           StateWeather == 'Cloudy' ||
//           StateWeather == 'Mostly Cloudy' ||
//           StateWeather == 'Hail' ||
//           StateWeather == 'Blowing Snow' ||
//           StateWeather == 'Blizzard' ||
//           StateWeather == 'Snowdrift' ||
//           StateWeather == 'Snowstorm' ||
//           StateWeather == 'Snow' ||
//           StateWeather == 'Snow Showers' ||
//           StateWeather == 'Flurries' ||
//           StateWeather == 'Heavy Snow' ||
//           StateWeather == 'Snowfall' ||
//           StateWeather == 'Light Snow' ||
//           StateWeather == 'Sleet' ||
//           StateWeather == 'Showers' ||
//           StateWeather == 'Heavy Showers' ||
//           StateWeather == 'Rainshower' ||
//           StateWeather == 'Rain' ||
//           StateWeather == 'Light Rain' ||
//           StateWeather == 'Overcast' ||
//           StateWeather == 'Wet' ||
//           StateWeather == 'Mist';
//     }
//     return Colors.grey;
//   }
  // MaterialColor get ACOlors {
  //   if (StateWeather == 'Sandstorm' ||
  //       StateWeather == 'Duststorm' ||
  //       StateWeather == 'Sand' ||
  //       StateWeather == 'Dust') {
  //     return Colors.yellow;
  //   } else if (StateWeather == 'Thunderstorms' ||
  //       StateWeather == 'Storm' ||
  //       StateWeather == 'Lightning' ||
  //       StateWeather == 'Thunder ') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Hail') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Blowing Snow' ||
  //       StateWeather == 'Blizzard' ||
  //       StateWeather == 'Snowdrift' ||
  //       StateWeather == 'Snowstorm') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Snow' ||
  //       StateWeather == 'Snow Showers' ||
  //       StateWeather == 'Flurries') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Heavy Snow' || StateWeather == 'Snowfall') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Light Snow') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Sleet') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Showers' ||
  //       StateWeather == 'Heavy Showers' ||
  //       StateWeather == 'Rainshower') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Rain') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Light Rain') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Fog' || StateWeather == 'Haze') {
  //     return Colors.orange;
  //   } else if (StateWeather == 'Overcast') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Sunny' ||
  //       StateWeather == 'Clearing' ||
  //       StateWeather == 'Fair' ||
  //       StateWeather == 'Clear' ||
  //       StateWeather == 'Fine') {
  //     return Colors.orange;
  //   } else if (StateWeather == 'Partly Cloudy' ||
  //       StateWeather == 'Partly cloudy' ||
  //       StateWeather == 'Partly Bright' ||
  //       StateWeather == 'Cloudy' ||
  //       StateWeather == 'Mostly Cloudy') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Windy' || StateWeather == 'Gale') {
  //     return Colors.grey;
  //   } else if (StateWeather == 'Wet') {
  //     return Colors.blueGrey;
  //   } else if (StateWeather == 'Hot') {
  //     return Colors.orange;
  //   } else if (StateWeather == 'Cool' || StateWeather == 'Cold') {
  //     return Colors.grey;
  //   }
  //   return Colors.blue;
  // }

  // @override
  // String toString() {
  //   return 'CityName = $CityName'
  //       '\t'
  //       'Date = $Date'
  //       ' \t'
  //       'Temp  = $Temp'
  //       ' \t'
  //       'MaxTemp = $MaxTemp'
  //       ' \t'
  //       'MinTemp = $MinTemp'
  //       ' \t'
  //       ' StateWeather = $StateWeather ';
  // }
}
