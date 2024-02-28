
import 'package:flutter/material.dart';
import 'package:weather_status_5_days/logic/weather_screen_logic.dart';
import 'package:weather_status_5_days/models/models.dart';
import 'package:weather_status_5_days/pages/screens.dart';
import 'package:weather_status_5_days/widgets/widgets.dart';

class WeatherScreen extends StatefulWidget {

  static const String routerName = 'WeatherScreen';

  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  Weather weatherCity = Weather(
    cod: '', 
    message: 0, 
    cnt: 0, 
    list: [], 
    city: City(
      id: 0, 
      name: '', 
      coord: Coord(lat: 0, lon: 0), 
      country: '', 
      population: 0, 
      timezone: 0, 
      sunrise: 0, 
      sunset: 0
    )
  );

  @override
  void initState() {
    super.initState();
    getWeather(latState, longState).then((value) {
      if (mounted) {
        setState(() {
          weatherCity = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      child: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(            
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.7),
          body: SingleChildScrollView(
            child: Column(
              children: [
                weatherCity.city.country == ''
                ? const LinearProgressIndicator()
                : WeatherStatus(size: size, weatherCity: weatherCity),
                weatherCity.city.country == ''
                ?  Container()
                : ListWeather(size: size, weatherCity: weatherCity),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
          floatingActionButton: IconBack(size: size,)
        ),
      ),
    );
  }
}



