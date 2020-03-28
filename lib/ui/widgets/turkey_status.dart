import 'package:covid_19_tracker_in_flutter/ui/widgets/cases_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';

class TurkeyStatus extends StatefulWidget {
  final int totalRecovered;
  final int totalActiveCases;
  final int totalDeaths;
  final int totalCases;

  const TurkeyStatus({
    Key key,
    @required this.totalRecovered,
    @required this.totalActiveCases,
    @required this.totalDeaths,
    @required this.totalCases,
  }) : super(key: key);

  @override
  _TurkeyStatusState createState() => _TurkeyStatusState();
}

class _TurkeyStatusState extends State<TurkeyStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .17,
          width: MediaQuery.of(context).size.width * .9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 8)],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    AppStrings.turkey,
                    style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, letterSpacing: 0.68, fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CasesRow(
                    totalActiveCases: widget.totalActiveCases,
                    totalCases: widget.totalCases,
                    totalDeaths: widget.totalDeaths,
                    totalRecovered: widget.totalRecovered,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
