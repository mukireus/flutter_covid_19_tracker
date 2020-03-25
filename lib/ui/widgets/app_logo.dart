import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, fontSize: 26, fontWeight: FontWeight.bold),
          children: <TextSpan>[TextSpan(text: 'COVID'), TextSpan(text: '-19', style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.colorBlue))],
        ),
      ),
    );
  }
}
