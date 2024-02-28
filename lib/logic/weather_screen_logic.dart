import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_status_5_days/models/models.dart';

// To get Cities
Future<List<Cities>> getCities() async {
  try {
    // Define the URL for the API endpoint
    final url = Uri.parse('https://search.reservamos.mx/api/v2/places');

    // Send an HTTP GET request to the specified URL
    final http.Response response = await http.get(url);

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Parse the response body as JSON
      final List<dynamic> data = jsonDecode(response.body);

      // Deserialize JSON data into CitiesList object
      final CitiesList responseCities = CitiesList.fromJson(data);

      // Return the list of cities extracted from the response
      return responseCities.cities;
    } else {
      // Throw an exception if the HTTP request was not successful
      throw Exception('Failed to load cities: ${response.statusCode}');
    }
  } catch (e) {
    // Error handling
    Exception('Error in getCities: $e');

    // Return an empty list in case of an error
    return [];
  }
}

//To get weather
Future<Weather> getWeather(double lat, double lon) async {

  const String appId = '0eebd1fcf852d29ca0340c5c451d4c9a';
  const String units = 'metric';

  try {
    // Define the URL for the API endpoint
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/forecast'
        '?lat=$lat&lon=$lon&appid=$appId&units=$units');

    // Send an HTTP GET request to the specified URL
    final http.Response response = await http.get(url);

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Parse the response body as JSON
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Deserialize JSON data into Weather object
      final Weather weather = Weather.fromMap(data);

      // Return the weather object extracted from the response
      return weather;
    } else {
      // Throw an exception if the HTTP request was not successful
      throw Exception('Failed to load weather: ${response.statusCode}');
    }
  } catch (e) {
    // Error handling
    Exception('Error in getWeather: $e');

    // Rethrow the exception to propagate it up
    rethrow;
  }
}
