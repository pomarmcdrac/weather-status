import 'package:flutter/material.dart';
import 'package:weather_status_5_days/models/models.dart';
import 'package:weather_status_5_days/widgets/widgets.dart';

import '../logic/weather_screen_logic.dart';

class HomeScreen extends StatefulWidget {

  static const String routerName = 'HomeScreen';
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Cities> listCities = [];
  List<String> cities = [];

  @override
  void initState() {
    super.initState();
    getCities().then((value) {
      listCities = value;
      for (var element in value) {
        cities.add(element.cityName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomSearchBar(cities: cities ),
            TextButton(
              onPressed: () async {
                // final responsive = await getWeather(19.4326077, -99.133208);
              }, 
              child: const Text('getCities')
            )
          ],
        ),
      ),
    );
  }
}