import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:country_api/model/country.dart';

class CountryService {
  String _url = "https://restcountries.eu/rest/v2/all";

  Future<List<Country>> fetchCountries() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      Iterable country = json.decode(response.body);
      return country.map((e) => Country.fromJson(e)).toList();
    } else {
      throw Exception("Hatalı Deneme");
    }
  }
}
