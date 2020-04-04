import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CasesRow extends StatelessWidget {
  final int totalCases;
  final int totalDeaths;
  final int totalRecovered;
  final int totalActiveCases;

  const CasesRow({
    Key key,
    @required this.totalCases,
    @required this.totalDeaths,
    @required this.totalRecovered,
    @required this.totalActiveCases,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorDarkBlue),
            Text(totalCases.toString(), style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, fontWeight: FontWeight.w800, fontSize: 17)),
            Text(AppStrings.vaka, style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, fontWeight: FontWeight.w700, fontSize: 14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorDarkRed),
            Text(totalDeaths.toString(), style: GoogleFonts.openSans(color: AppColors.colorDarkRed, fontWeight: FontWeight.w800, fontSize: 17)),
            Text(AppStrings.vefat, style: GoogleFonts.openSans(color: AppColors.colorDarkRed, fontWeight: FontWeight.w700, fontSize: 14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add_box, size: 20, color: AppColors.colorGreen),
            Text(totalRecovered.toString(), style: GoogleFonts.openSans(color: AppColors.colorGreen, fontWeight: FontWeight.w800, fontSize: 17)),
            Text(AppStrings.iyilesen, style: GoogleFonts.openSans(color: AppColors.colorGreen, fontWeight: FontWeight.w700, fontSize: 14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorPrimary),
            Text(totalActiveCases.toString(), style: GoogleFonts.openSans(color: AppColors.colorPrimary, fontWeight: FontWeight.w800, fontSize: 17)),
            Text(AppStrings.aktifVaka, style: GoogleFonts.openSans(color: AppColors.colorPrimary, fontWeight: FontWeight.w700, fontSize: 14)),
          ],
        )
      ],
    );
  }
}
