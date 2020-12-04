import 'dart:convert';

List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  Country({
    this.name,
    this.capital,
    this.region,
    this.population,
    this.area,
    this.flag,
  });

  String name;
  String capital;
  Region region;
  int population;
  double area;
  String flag;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        capital: json["capital"],
        region: regionValues.map[json["region"]],
        population: json["population"],
        area: json["area"] == null ? null : json["area"].toDouble(),
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "capital": capital,
        "region": regionValues.reverse[region],
        "population": population,
        "area": area == null ? null : area,
        "flag": flag,
      };
}

enum Region { ASIA, EUROPE, AFRICA, OCEANIA, AMERICAS, POLAR, EMPTY }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Asia": Region.ASIA,
  "": Region.EMPTY,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA,
  "Polar": Region.POLAR
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
