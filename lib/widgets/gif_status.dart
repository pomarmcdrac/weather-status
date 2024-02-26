
import 'dart:convert';

class PlacesResponse {
    final int id;
    final String slug;
    final String citySlug;
    final String display;
    final String asciiDisplay;
    final String cityName;
    final String cityAsciiName;
    final String state;
    final Country country;
    final String lat;
    final String long;
    final ResultType resultType;
    final String popularity;

    PlacesResponse({
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

    factory PlacesResponse.fromRawJson(String str) => PlacesResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PlacesResponse.fromJson(Map<String, dynamic> json) => PlacesResponse(
        id: json["id"],
        slug: json["slug"],
        citySlug: json["city_slug"],
        display: json["display"],
        asciiDisplay: json["ascii_display"],
        cityName: json["city_name"],
        cityAsciiName: json["city_ascii_name"],
        state: json["state"],
        country: countryValues.map[json["country"]]!,
        lat: json["lat"],
        long: json["long"],
        resultType: resultTypeValues.map[json["result_type"]]!,
        popularity: json["popularity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "city_slug": citySlug,
        "display": display,
        "ascii_display": asciiDisplay,
        "city_name": cityName,
        "city_ascii_name": cityAsciiName,
        "state": state,
        "country": countryValues.reverse[country],
        "lat": lat,
        "long": long,
        "result_type": resultTypeValues.reverse[resultType],
        "popularity": popularity,
    };
}

enum Country {
    MXICO
}

final countryValues = EnumValues({
    "México": Country.MXICO
});

enum ResultType {
    AIRPORT,
    CITY,
    TERMINAL
}

final resultTypeValues = EnumValues({
    "airport": ResultType.AIRPORT,
    "city": ResultType.CITY,
    "terminal": ResultType.TERMINAL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
