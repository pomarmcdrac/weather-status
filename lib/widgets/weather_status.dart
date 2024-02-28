import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_status_5_days/models/models.dart';

class WeatherStatus extends StatelessWidget {
  const WeatherStatus({
    super.key,
    required this.size,
    required this.weatherCity,
  });

  final Size size;
  final Weather weatherCity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              children: [
                AjustTextTitle(weatherCity: weatherCity),
                AjustTextSub(text: weatherCity.city.country),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.3,
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: 'http://openweathermap.org/img/w/${weatherCity.list[0].weather[0].icon}.png'
                ),
                AjustTextSub(text: weatherCity.list[0].weather[0].main),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AjustTextSub extends StatelessWidget {
  const AjustTextSub({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        color: Colors.grey[600]
      ),
      maxLines: 1,
      minFontSize: 12,
      maxFontSize: 18,
    );
  }
}

class AjustTextTitle extends StatelessWidget {
  const AjustTextTitle({
    super.key,
    required this.weatherCity,
  });

  final Weather weatherCity;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      weatherCity.city.name,
      style: TextStyle(
        color: Colors.grey[800]
      ),
      maxLines: 1,
      minFontSize: 16,
      maxFontSize: 20,
    );
  }
}