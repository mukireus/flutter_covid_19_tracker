import 'package:covid_19_tracker_in_flutter/models/global_data.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CovidAPI {
  static const String baseUrl = 'https://thevirustracker.com/free-api';
  Dio _dio;
  apiClient() {
    BaseOptions options = BaseOptions(
      receiveTimeout: 100000,
      connectTimeout: 100000,
      baseUrl: baseUrl,
    );
    _dio = Dio(options);
  }

  Future<GlobeData> getAllCountryData() async {
    final url = '$baseUrl?global=stats';

    try {
      final response = await _dio.get(url);
      return GlobeData.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      throw e.error;
    }
  }

  Future<http.Response> getCountryNews(String countryCode) async {
    final url = '$baseUrl?countryTotal=$countryCode';
    return await http.get(url);
    // try {
    //   final response = await _dio.get(url);

    //   return response;
    // } on DioError catch (e) {
    //   print(e.error);
    //   throw e.error;
    // }
  }
}
