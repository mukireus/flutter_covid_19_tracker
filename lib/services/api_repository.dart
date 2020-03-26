import 'package:covid_19_tracker_in_flutter/models/global_data.dart';
import 'package:covid_19_tracker_in_flutter/services/covid_api.dart';
import 'package:flutter/material.dart';

class ApiRepository {
  final CovidAPI apiClient;

  ApiRepository({@required this.apiClient}) : assert(apiClient != null);
  Future<GlobeData> getAllCountryData() async {
    return apiClient.getAllCountryData();
  }
}
