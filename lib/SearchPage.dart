// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Model/WeatherModel.dart';
import 'package:weather_app/Providers/provider.dart';
import 'package:weather_app/Serves/weatherserves.dart';
import 'package:weather_app/pages/home_page.dart';

class SeatchPage extends StatefulWidget {
  const SeatchPage({CityName});
  @override
  State<SeatchPage> createState() => _SeatchPageState();
}

class _SeatchPageState extends State<SeatchPage> {
  String? CityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        toolbarHeight: 70,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            obscureText: false,
            onChanged: (data) {
              CityName = data;
            },
            onSubmitted: (data) async {
              CityName = data;
              weatherServes serves = weatherServes();
              weatherModel? weather = await serves.getweather(CityName: CityName!);
              print(weather);
              Provider.of<Weatherprovider>(context, listen: false)
                  .ChangeWeather = weather;

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            },
            maxLength: 21,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 29),
              hintText: 'Enter Your City',
              labelText: 'City',

              suffixIcon: GestureDetector(
                  onTap: () async {
                    weatherServes serves = weatherServes();
                    weatherModel? weather =
                        await serves.getweather(CityName: CityName!);
                    Provider.of<Weatherprovider>(context, listen: false)
                        .ChangeWeather = weather;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                  child: const Icon(Icons.search)),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(29),
                  topRight: Radius.circular(29),
                ),
              ),
              // label: Text('City'),
            ),
          ),
        ),
      ),
    );
  }
}
