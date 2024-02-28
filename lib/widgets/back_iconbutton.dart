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
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.blue,
        size: size.width * 0.1,
        shadows: const [
          Shadow(
            color: Colors.white,
          )
        ],
      )
    );
  }
}