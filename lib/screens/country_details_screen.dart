import 'package:covid_19_tracker_in_flutter/models/result.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/country_status.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryDetailsScreen extends StatefulWidget {
  @override
  _CountryDetailsScreenState createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  Map data = {};
  Result _result;
  CountryResult _countryResult;
  String imageUrl, countryName;

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context).settings.arguments;
    _countryResult = data['countryResults'];
    _setResult();
    super.didChangeDependencies();
  }

  void _setResult() {
    setState(() {
      _result = new Result(
        totalActiveCases: _countryResult.totalActiveCases,
        totalCases: _countryResult.totalCases,
        totalDeaths: _countryResult.totalDeaths,
        totalRecovered: _countryResult.totalRecovered,
      );
      countryName = _countryResult.countryName;
      imageUrl = "https://source.unsplash.com/1280x720/?$countryName";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLight,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.colorDarkBlue,
              expandedHeight: MediaQuery.of(context).size.height * .32,
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
              floating: true,
              forceElevated: true,
              snap: true,
              pinned: true,
              flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                child: FlexibleSpaceBar(
                    centerTitle: true, title: Text(countryName, style: _sliverAppBarTitleStyle), background: Image.network(imageUrl, fit: BoxFit.cover)),
              ),
              automaticallyImplyLeading: true,
              leading: _leadingButton,
            ),
            SliverPadding(
              padding: new EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CountryStatus(
                        totalRecovered: _result.totalRecovered,
                        totalActiveCases: _result.totalActiveCases,
                        totalDeaths: _result.totalDeaths,
                        totalCases: _result.totalCases,
                        countryName: countryName,
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ];
        },
        body: Column(),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  TextStyle get _sliverAppBarTitleStyle => GoogleFonts.openSans(
      fontWeight: FontWeight.bold, color: Colors.white, shadows: <Shadow>[Shadow(offset: Offset(1.0, 1.0), blurRadius: 3.0, color: Colors.black)]);
  IconButton get _leadingButton => IconButton(
      icon: FaIcon(FontAwesomeIcons.chevronLeft, color: Colors.white), onPressed: () => Navigator.pushReplacementNamed(context, AppStrings.pageHomeNavigator));
}
