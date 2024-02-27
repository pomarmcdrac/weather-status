
class CitiesList {
  final List<Cities> cities;

  CitiesList({
    required this.cities,
  });

  factory CitiesList.fromJson(List<dynamic> parsedJson) {

    List<Cities> cities = <Cities>[];
    cities = parsedJson.map((i) => Cities.fromJson(i)).toList();

    return CitiesList(
      cities: cities
    );
  }
}
class Cities {
  final int id;
  final String slug;
  final String citySlug;
  final String display;
  final String asciiDisplay;
  final String cityName;
  final String cityAsciiName;
  final String state;
  final String country;
  final String lat;
  final String long;
  final String resultType;
  final String popularity;

  Cities({
    required this.id,
    required this.slug,
    required this.citySlug,
    required this.display,
    required this.asciiDisplay,
    required this.cityName,
    required this.cityAsciiName,
    required this.state,
    required this.country,
    required this.lat,
    required this.long,
    required this.resultType,
    required this.popularity,
  });

  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(
      id: json["id"] ?? 0,
      slug: json["slug"] ?? '',
      citySlug: json["city_slug"] ?? '',
      display: json["display"] ?? '',
      asciiDisplay: json["ascii_display"] ?? '',
      cityName: json["city_name"] ?? '',
      cityAsciiName: json["city_ascii_name"] ?? '',
      state: json["state"] ?? '',
      country: json["country"] ?? '',
      lat: json["lat"] ?? '',
      long: json["long"] ?? '',
      resultType: json["result_type"] ?? '',
      popularity: json["popularity"] ?? '',
    );
  }
}
