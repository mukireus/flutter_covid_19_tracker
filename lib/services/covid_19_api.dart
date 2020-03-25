import 'package:http/http.dart' as http;

class CovidAPI {
  static const String url = 'https://thevirustracker.com/free-api?global=stats';

  

  Future<http.Response> getGlobalData() async => await http.get(
        '$url?global=stats',
      );
}
