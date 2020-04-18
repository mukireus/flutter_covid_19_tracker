import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart';

final String baseUrl = 'https://corona.lmao.ninja/';

class Result {
  final int totalCases;
  final int totalRecovered;
  final int totalDeaths;
  final int totalActiveCases;

  Result({
    this.totalCases,
    this.totalRecovered,
    this.totalDeaths,
    this.totalActiveCases,
  });
}

class CountryResult {
  int totalRecovered;
  int totalActiveCases;
  int totalDeaths;
  int totalCases;
  String countryName;

  CountryResult({
    this.totalRecovered,
    this.totalActiveCases,
    this.totalDeaths,
    this.totalCases,
    this.countryName,
  });
}

Future<Result> getAllData() async {
  Result result;

  try {
    Response response = await get(baseUrl + "v2/all");
    Map info = jsonDecode(response.body);
    result = new Result(
      totalDeaths: info["deaths"],
      totalActiveCases: info["active"],
      totalCases: info["cases"],
      totalRecovered: info["recovered"],
    );
    print(info);
  } catch (e) {
    print("Data alınamadı. getAllData() $e");
  }
  return result;
}

Future<List<CountryResult>> getAllCountriesData() async {
  List<CountryResult> country = [];
  try {
    Response response = await get(baseUrl + "v2/countries");
    List data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
      CountryResult _report = new CountryResult(
        totalDeaths: data[i]["deaths"],
        totalRecovered: data[i]["recovered"],
        totalCases: data[i]["cases"],
        totalActiveCases: data[i]["active"],
        countryName: data[i]["country"],
      );
      country.add(_report);
    }
  } catch (e) {
    print("Data alınamadı. getAllCountriesData() $e");
  }
  return country;
}
