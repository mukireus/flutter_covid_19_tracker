import 'package:covid_19_tracker_in_flutter/screens/home_screen.dart';
import 'package:covid_19_tracker_in_flutter/screens/world_screen.dart';
import 'package:covid_19_tracker_in_flutter/screens/sempton_screen.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentIndex = 1;
  List<Widget> _pages = [SemptonScreen(), HomeScreen(), WorldScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLight,
      appBar: CovidAppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          child: BottomNavigationBar(
            onTap: (int val) {
              if (val == _currentIndex) return;
              setState(() {
                _currentIndex = val;
              });
            },
            currentIndex: _currentIndex,
            unselectedLabelStyle: GoogleFonts.openSans(fontWeight: _labelFontStyle),
            unselectedIconTheme: IconThemeData(color: AppColors.colorBlue),
            selectedIconTheme: IconThemeData(color: AppColors.colorDarkBlue),
            selectedLabelStyle: GoogleFonts.openSans(fontWeight: _labelFontStyle),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.thermometer), title: Text(AppStrings.sempton, style: _labelStyle)),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.clinicMedical), title: Text(AppStrings.anasayfa, style: _labelStyle)),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.globeEurope), title: Text(AppStrings.dunya, style: _labelStyle)),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get _labelStyle => TextStyle(color: AppColors.colorDarkBlue);

  FontWeight get _labelFontStyle => FontWeight.bold;
}
