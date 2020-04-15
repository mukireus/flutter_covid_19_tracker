import 'package:covid_19_tracker_in_flutter/ui/helper/app_animations.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/sempton_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SemptonScreen extends StatefulWidget {
  @override
  _SemptonScreenState createState() => _SemptonScreenState();
}

class _SemptonScreenState extends State<SemptonScreen> {
  double _opacity = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
        child: AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: _opacity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _header(AppStrings.semptonlar),
                  SemptonContainer(header: AppStrings.semptom1, animationPath: AppAnimations.temperature),
                  SemptonContainer(header: AppStrings.semptom2, animationPath: AppAnimations.sneezing),
                  SemptonContainer(header: AppStrings.semptom3, animationPath: AppAnimations.hardSneezing),
                ],
              ),
              Column(
                children: <Widget>[
                  _header(AppStrings.tavsiyeler),
                  SemptonContainer(header: AppStrings.tavsiye1, animationPath: AppAnimations.washHands),
                  SemptonContainer(header: AppStrings.tavsiye2, animationPath: AppAnimations.dezenfekt),
                  SemptonContainer(header: AppStrings.tavsiye3, animationPath: AppAnimations.socialDistance),
                  SemptonContainer(header: AppStrings.tavsiye4, animationPath: AppAnimations.mask),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(String header) => Text(header, style: _headerStyle);

  TextStyle get _headerStyle => GoogleFonts.openSans(color: AppColors.colorDarkRed, fontWeight: FontWeight.bold, letterSpacing: 0.68, fontSize: 18);
}
