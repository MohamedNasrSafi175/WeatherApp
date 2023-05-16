// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/WeatherModel.dart';

class weatherServes {
  weatherModel? weather;
  Future<weatherModel?> getweather({required String? CityName}) async {
    // change from  String to URl
    String BaseUrl = 'http://api.weatherapi.com/v1';
    String Keys = 'key=a818715566194c71824172151222212';
    Uri url = Uri.parse(
        '$BaseUrl/forecast.json?$Keys&q=$CityName&days=1&aqi=no&alerts=no');

    /*    get => enter to Url and used the information 
          Response => used to information from Url 
          http://api.weatherapi.com/v1/forecast.json?key=a818715566194c71824172151222212&q=cairo&days=1&aqi=no&alerts=no
          http://api.weatherapi.com/v1/forecast.json?key=a818715566194c71824172151222212&q=cairo%20&days=1&aqi=no&alerts=no
     */
    try {
      
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      /* JsonDecode => change the information form response.body to json
      response.body => used The Information 
      نستخدم ماب لانه نظام تخزين في ال جيسون  ونخزن فيه المعلومات القادمه من  
      JsonDecode(Response.body);
    
    */
      Map<String, dynamic>? Data = jsonDecode(response.body);
      weather = weatherModel.fromJson(Data);
      print(Data);
    } 
    } catch (e) {
      print(e);
    }
      return weather;
      // throw Exception("Failed to Found ${response.statusCode}");
    
    }
  }

// weatherModel? weather1;
// Future<weatherModel?> getweather({required String CityName}) async {
//   try {
//     Uri url = Uri.parse(
//         'http://api.weatherapi.com/v1/forecast.json?key=a818715566194c71824172151222212&q=$CityName&days=1&aqi=no&alerts=no');
//     http.Response response = await http.get(url);
//     Map<String, dynamic> Data = jsonDecode(response.body);
//     weatherModel weather1 = weatherModel.fromJson(Data.);
//   } catch (e) {
//     throw Exception(e);
//   }
//   return weather1;
// }
