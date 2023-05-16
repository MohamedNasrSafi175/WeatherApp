// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/provider.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return Weatherprovider();
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
