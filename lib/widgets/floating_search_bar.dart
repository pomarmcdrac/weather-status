import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_status_5_days/models/models.dart';
import 'package:weather_status_5_days/pages/home_screen.dart';
import 'package:weather_status_5_days/pages/weather_screen.dart';

class CustomSearchBar extends StatefulWidget {
  final List<Cities> cities;
  final Size size; // Arreglo de ciudades y coordenadas

  const CustomSearchBar({Key? key, 
    required this.cities,
    required this.size
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: 70,
          width: widget.size.width * 0.6,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.indigoAccent.shade100,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TypeAheadField(
            builder: (context, controller, focusNode) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  cursorColor: Colors.indigo,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your destination...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
            suggestionsCallback: (pattern) async {
              // Filtrar ciudades que coincidan con el patrón
              return widget.cities.where((city) {
                final cityName = city.cityName.toString().toLowerCase();
                return cityName.contains(pattern.toLowerCase());
              }).toList();
            },
            itemBuilder: (context, suggestion) {
              final cityName = suggestion.cityName.toString();
              final displayName = suggestion.display.toString();
              return ListTile(
                title: AutoSizeText(
                  cityName,
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                  ),
                  maxLines: 1,
                  minFontSize: 16,
                  maxFontSize: 24,
                ),
                subtitle: AutoSizeText(
                  displayName,
                  style: TextStyle(
                    color: Colors.blueGrey[500],
                  ),
                  maxLines: 1,
                  minFontSize: 8,
                  maxFontSize: 16,
                ),
              );
            },
            onSelected: (suggestion) {
              // Manejar la selección de una sugerencia
              final cityName = suggestion.cityName.toString();
              final double lat = double.parse(suggestion.lat.toString());
              final double long = double.parse(suggestion.long.toString());
              if (context.mounted) {
                setState(() {
                  cityState = cityName;
                  latState = lat;
                  longState = long;
                });
              }
              Navigator.pushNamed(context, WeatherScreen.routerName);
            },
          ),
        ),
      ),
    );
  }
}
