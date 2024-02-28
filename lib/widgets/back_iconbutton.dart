import 'package:flutter/material.dart';
import 'package:weather_status_5_days/pages/screens.dart';

class IconBack extends StatelessWidget {
  const IconBack({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routerName);
      }, 
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.blue,
        size: 30,
        shadows: [
          Shadow(
            color: Colors.white,
          )
        ],
      )
    );
  }
}