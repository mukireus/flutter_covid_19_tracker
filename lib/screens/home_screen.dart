import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/country_status.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/globe_status.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/top_5.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker_in_flutter/models/result.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  Result _result = new Result();
  List<CountryResult> _countryResult = [];
  int turkeyTotalRecovered = 0;
  int turkeyTotalActiveCases = 0;
  int turkeyTotalDeaths = 0;
  int turkeyTotalCases = 0;
  String _countryName;

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
      // Sıralama
      Comparator<CountryResult> comparator = (b, a) => a.totalCases.compareTo(b.totalCases);
      _countryResult.sort(comparator);
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
          _countryName = "Türkiye";
        }
      });
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    getData();
    getTurkeyData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    if (_countryResult.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: LoadingIndicator(
            indicatorType: Indicator.ballScaleMultiple,
            color: AppColors.colorDarkRed,
          ),
        ),
      );
    } else {
      return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
        controller: _refreshController,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 20.0), child: GlobeStatus(result: _result)),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, AppStrings.pageTurkeyDetails, arguments: {"countryResults": _countryResult[3]}),
                  child: CountryStatus(
                    countryName: _countryName,
                    totalActiveCases: turkeyTotalActiveCases,
                    totalCases: turkeyTotalCases,
                    totalDeaths: turkeyTotalDeaths,
                    totalRecovered: turkeyTotalRecovered,
                  ),
                ),
              ),
              TopContainer(countryList: _countryResult),
            ],
          ),
        ),
      );
    } // else
  }
}
