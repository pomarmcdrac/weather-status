import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_status_5_days/models/models.dart';
import 'package:weather_status_5_days/widgets/widgets.dart';

class ListWeather extends StatelessWidget {
  const ListWeather({
    super.key,
    required this.size,
    required this.weatherCity,
  });

  final Size size;
  final Weather weatherCity;

  @override
  Widget build(BuildContext context) {

    String expresionRegular(double temp){
      NumberFormat f = NumberFormat("##0", "es_MX");
      String result = f.format(temp);
      return result;
    }
    
    return SizedBox(
      height: size.height * 0.8,
      child: ListView.builder(
        itemCount: weatherCity.list.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AjustTextSub(text: "Date: ${weatherCity.list[index].dtTxt.month}/${weatherCity.list[index].dtTxt.day}"),
                  AjustTextSub(text: "Time: ${weatherCity.list[index].dtTxt.hour}:00"),
                  AjustTextSub(text: "Max ${expresionRegular(weatherCity.list[index].main.tempMax)} °C"),
                  AjustTextSub(text: "Min ${expresionRegular(weatherCity.list[index].main.tempMin)} °C"),
                  CachedNetworkImage(
                    imageUrl: 'http://openweathermap.org/img/w/${weatherCity.list[index].weather[0].icon}.png'
                  ),
                ],
              ),
            ),
          );
          
        },
      ),
    );
  }
}