import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:covid_19_tracker_in_flutter/models/result.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/cases_row.dart';

class GlobeStatus extends StatefulWidget {
  final Result result;

  const GlobeStatus({
    Key key,
    @required this.result,
  }) : super(key: key);

  @override
  _GlobeStatusState createState() => _GlobeStatusState();
}

class _GlobeStatusState extends State<GlobeStatus> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                AppStrings.kureselDurum,
                style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, letterSpacing: 0.68, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CasesRow(
                totalActiveCases: widget.result.totalActiveCases,
                totalCases: widget.result.totalCases,
                totalDeaths: widget.result.totalDeaths,
                totalRecovered: widget.result.totalRecovered,
              ),
            )
          ],
        ),
      ),
    );
  }
}
