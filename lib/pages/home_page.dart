// ignore_for_file: unrelated_type_equality_checks, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names, unused_import, duplicate_import

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Model/WeatherModel.dart';
import 'package:weather_app/Providers/provider.dart';
import 'package:weather_app/Serves/weatherserves.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/searchpage.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/rendering/shifted_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

weatherModel? weatherData;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<Weatherprovider>(context).getChangeWeather;

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<Weatherprovider>(context)
                      .weatherData
                      ?.ACOlors() ==
                  null
              ? Colors.blue
              : Provider.of<Weatherprovider>(context).weatherData!.ACOlors()),
      home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeatchPage(),
                        ));
                  },
                  icon: const Icon(Icons.search)),
            ],
            title: const Text('Weather App'),
            toolbarHeight: 70,
          ),
          body: Provider.of<Weatherprovider>(context).weatherData == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_hpdv2lor.json'),
                    ],
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      weatherData!.ACOlors(),
                      weatherData!.ACOlors()[200]!,
                      weatherData!.ACOlors()[100]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(flex: 2),
                      Center(
                        child: Text(weatherData!.CityName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 32)),
                      ),
                      Center(
                        child: Text(weatherData!.Location,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Update at',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            weatherData!.Date.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network("http:${weatherData!.Icons}"),
                          /*Image.network(
                          'http:${weatherData!.Icons}',
                          color: Colors.black,
                        ),*/
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              '  ${weatherData!.Temp.toInt()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            ' MixTemp : ${weatherData!.MaxTemp.toInt().toString()}\n'
                            ' MinTemp : ${weatherData!.MinTemp.toInt().toString()}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          weatherData!.StateWeather,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ))),
    );
  }
}
