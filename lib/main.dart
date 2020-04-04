import 'package:covid_19_tracker_in_flutter/screens/country_details_screen.dart';
import 'package:covid_19_tracker_in_flutter/screens/home_navigator.dart';
import 'package:covid_19_tracker_in_flutter/screens/sempton_screen.dart';
import 'package:covid_19_tracker_in_flutter/screens/turkey_details_screen.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: AppStrings.appName,
      initialRoute: AppStrings.pageHomeNavigator,
      routes: {
        AppStrings.pageHomeNavigator: (context) => HomeNavigator(),
        AppStrings.pageHome: (context) => HomeScreen(),
        AppStrings.pageTurkeyDetails: (context) => TurkeyDetailsScreen(),
        AppStrings.pageSempton: (context) => SemptonScreen(),
        AppStrings.pageCountryDetails: (context) => CountryDetailsScreen(),
      },
    );
  }
}
