import 'package:flutter/material.dart';
import 'package:weather_status_5_days/logic/weather_screen_logic.dart';

class HomeScreen extends StatefulWidget {

  static const String routerName = 'HomeScreen';
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    // getCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('HomeScreen'),
            TextButton(
              onPressed: () async {
                final response = await getCities();
                final responsive = await getWeather(19.4326077, -99.133208);
                print(responsive);
              }, 
              child: const Text('getCities')
            )
          ],
        ),
      ),
    );
  }
}