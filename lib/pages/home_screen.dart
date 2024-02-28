import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_status_5_days/models/models.dart';
import 'package:weather_status_5_days/widgets/widgets.dart';

import '../logic/weather_screen_logic.dart';

String cityState = '';
double longState = 0;
double latState = 0;

class HomeScreen extends StatefulWidget {

  static const String routerName = 'HomeScreen';
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Cities> listCities = [];

  @override
  void initState() {
    super.initState();
    getCities().then((value) {
      if (mounted) {
        setState(() {
          listCities = value;
          cityState = '';
          latState = 0;
          longState = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.2),
              Container(
                height: size.height * 0.15,
                width: size.width * 0.6,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AutoSizeText(
                  "Do you want to check the weather at your destination?",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  maxFontSize: 26,
                  minFontSize: 16,
                ),
              ),
              CustomSearchBar(
                cities: listCities,
                size: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}