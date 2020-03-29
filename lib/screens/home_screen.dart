import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/globe_status.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/turkey_status.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker_in_flutter/models/result.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Result _result = new Result();
  List<CountryResult> _countryResult = [];
  int turkeyTotalRecovered = 0;
  int turkeyTotalActiveCases = 0;
  int turkeyTotalDeaths = 0;
  int turkeyTotalCases = 0;

  @override
  void initState() {
    getData();
    getTurkeyData();
    super.initState();
  }

  void getData() async {
    Result _temp = await getAllData();
    List<CountryResult> _countryTemp = await getAllCountriesData();
    setState(() {
      _result = _temp;
      _countryResult = _countryTemp;
      getTurkeyData();
    });
  }

  void getTurkeyData() async {
    setState(() {
      _countryResult.forEach((element) {
        if ((element.countryName) == "Turkey") {
          turkeyTotalCases = element.totalCases;
          turkeyTotalActiveCases = element.totalActiveCases;
          turkeyTotalDeaths = element.totalDeaths;
          turkeyTotalRecovered = element.totalRecovered;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _countryResult.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: LoadingIndicator(
                indicatorType: Indicator.ballScaleMultiple,
                color: AppColors.colorDarkRed,
              ),
            ),
          )
        : Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GlobeStatus(result: _result),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppStrings.pageTurkeyDetails);
                  },
                  child: TurkeyStatus(
                    totalActiveCases: turkeyTotalActiveCases,
                    totalCases: turkeyTotalCases,
                    totalDeaths: turkeyTotalDeaths,
                    totalRecovered: turkeyTotalRecovered,
                  ),
                ),
              ],
            ),
          );
  }
}
