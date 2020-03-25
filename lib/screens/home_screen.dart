import 'dart:convert';

import 'package:covid_19_tracker_in_flutter/models/global_data.dart';
import 'package:covid_19_tracker_in_flutter/services/covid_19_api.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/app_bar.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/app_bottombar.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/globe_status.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalData test;

  @override
  void initState() {
    getGlobalData().then((response) {
      test = GlobalData.fromJson(json.decode(response.data));
      setState(() {
        debugPrint('ui updated');
        print(response.data);
        print(response);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLight,
      appBar: CovidAppBar(),
      bottomNavigationBar: AppBottomNavigationBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GlobeStatus(),
            FlatButton(
              color: AppColors.colorGreen,
              child: Text("Test"),
              onPressed: () async {
                print("test");
                getGlobalData();
              },
            ),
            Text("Aktif Vaka" + test.activeCases.toString()),
            Text("Ölüm" + test.totalDeaths.toString()),
            Text("İyileşen" + test.totalRecovered.toString()),
            Text("Vaka" + test.totalCases.toString()),
          ],
        ),
      ),
    );
  }

  Future<Response> getGlobalData() async {
    var dio = Dio();
    createHttpRequestConfig(dio);
    Response response;
    await dio.get(CovidAPI.url).then((resp) {
      response = resp;
    });
    return response;
  }

  createHttpRequestConfig(dio) {
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 15000;
    dio.options.responseType = ResponseType.plain;
  }
}
