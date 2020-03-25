import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobeStatus extends StatefulWidget {
  @override
  _GlobeStatusState createState() => _GlobeStatusState();
}

class _GlobeStatusState extends State<GlobeStatus> {
  double _aktifVaka = 299.218;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 8)],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppStrings.kureselDurum,
              style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, letterSpacing: 0.68, fontWeight: FontWeight.w600, fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorDarkBlue),
                      Text("428,280", style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, fontWeight: FontWeight.w800, fontSize: 17)),
                      Text("Vaka", style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, fontWeight: FontWeight.w700, fontSize: 14)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorDarkRed),
                      Text("19,101", style: GoogleFonts.openSans(color: AppColors.colorDarkRed, fontWeight: FontWeight.w800, fontSize: 17)),
                      Text("Ölüm", style: GoogleFonts.openSans(color: AppColors.colorDarkRed, fontWeight: FontWeight.w700, fontSize: 14)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_box, size: 20, color: AppColors.colorGreen),
                      Text("109,961", style: GoogleFonts.openSans(color: AppColors.colorGreen, fontWeight: FontWeight.w800, fontSize: 17)),
                      Text("İyileşen", style: GoogleFonts.openSans(color: AppColors.colorGreen, fontWeight: FontWeight.w700, fontSize: 14)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorPrimary),
                      Text(_aktifVaka.toString(), style: GoogleFonts.openSans(color: AppColors.colorPrimary, fontWeight: FontWeight.w800, fontSize: 17)),
                      Text("Aktif Vaka", style: GoogleFonts.openSans(color: AppColors.colorPrimary, fontWeight: FontWeight.w700, fontSize: 14)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
