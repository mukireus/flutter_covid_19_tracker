import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:covid_19_tracker_in_flutter/models/result.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';

class TopContainer extends StatefulWidget {
  final List<CountryResult> countryList;

  const TopContainer({
    Key key,
    @required this.countryList,
  }) : super(key: key);

  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .45,
        width: MediaQuery.of(context).size.width * .9,
        decoration: _containerBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(left: 20.0), child: Text(AppStrings.kureselDurumilk5, style: _headerTextStyle)),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Table(
                  children: <TableRow>[
                    TableRow(children: [
                      TableCell(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 19,
                        ),
                      ),
                      TableCell(
                        child: Container(
                            height: MediaQuery.of(context).size.height / 19,
                            child: Center(child: _casesRow(FontAwesomeIcons.procedures, AppColors.colorDarkBlue))),
                      ),
                      TableCell(
                        child: Container(
                            height: MediaQuery.of(context).size.height / 19,
                            child: Center(child: _casesRow(FontAwesomeIcons.procedures, AppColors.colorDarkRed))),
                      ),
                      TableCell(
                        child: Container(
                            height: MediaQuery.of(context).size.height / 19,
                            child: Center(child: _casesRow(Icons.add_box, AppColors.colorGreen))),
                      ),
                    ]),
                    _countryStatusCell(1),
                    _countryStatusCell(2),
                    _countryStatusCell(3),
                    _countryStatusCell(4),
                    _countryStatusCell(5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get _casesRowIcons {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width * .15),
          _casesRow(FontAwesomeIcons.procedures, AppColors.colorDarkBlue),
          _casesRow(FontAwesomeIcons.procedures, AppColors.colorDarkRed),
          _casesRow(Icons.add_box, AppColors.colorGreen),
        ],
      ),
    );
  }

  Widget _countryStatus(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text((widget.countryList[index].countryName), style: _countryNameTextStyle),
          SizedBox(),
          Text(widget.countryList[index].totalCases.toString(), style: _countryCaseTextStyle(AppColors.colorDarkBlue)),
          Text(widget.countryList[index].totalDeaths.toString(), style: _countryCaseTextStyle(AppColors.colorDarkRed)),
          Text(widget.countryList[index].totalRecovered.toString(), style: _countryCaseTextStyle(AppColors.colorGreen)),
        ],
      ),
    );
  }

  TableRow _countryStatusCell(int index) {
    return TableRow(children: <Widget>[
      TableCell(
        child: Container(
            padding: EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 19,
            child: Text((widget.countryList[index].countryName), style: _countryNameTextStyle)),
        verticalAlignment: TableCellVerticalAlignment.middle,
      ),
      TableCell(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 19,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.countryList[index].totalCases.toString(), style: _countryCaseTextStyle(AppColors.colorDarkBlue)),
                Text(AppStrings.vaka, style: _countryCaseInfoTextStyle(AppColors.colorDarkBlue))
              ],
            ),
          )),
      TableCell(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 19,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.countryList[index].totalDeaths.toString(), style: _countryCaseTextStyle(AppColors.colorDarkRed)),
                Text(AppStrings.vefat, style: _countryCaseInfoTextStyle(AppColors.colorDarkRed))
              ],
            ),
          )),
      TableCell(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 19,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.countryList[index].totalRecovered.toString(), style: _countryCaseTextStyle(AppColors.colorGreen)),
                Text(AppStrings.iyilesen, style: _countryCaseInfoTextStyle(AppColors.colorGreen))
              ],
            ),
          )),
    ]);
  }

  BoxDecoration get _containerBoxDecoration => BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 8)]);
  TextStyle get _headerTextStyle => GoogleFonts.openSans(color: AppColors.colorDarkBlue, letterSpacing: 0.68, fontWeight: FontWeight.w700, fontSize: 14);
  TextStyle get _countryNameTextStyle => GoogleFonts.openSans(color: AppColors.colorDarkRed, fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle _countryCaseTextStyle(Color _color) => GoogleFonts.openSans(color: _color, fontSize: 14, fontWeight: FontWeight.bold);
  TextStyle _countryCaseInfoTextStyle(Color _color) => GoogleFonts.openSans(color: _color, fontSize: 10, fontWeight: FontWeight.w600);
  Widget _casesRow(IconData _icon, Color _color) => FaIcon(_icon, size: 20, color: _color);
}
