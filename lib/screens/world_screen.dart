import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WorldScreen extends StatefulWidget {
  @override
  _WorldScreenState createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSelectCountry();
        },
        tooltip: AppStrings.ulkeEkle,
        child: FaIcon(FontAwesomeIcons.plus),
        backgroundColor: AppColors.colorDarkBlue,
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }

  void _showSelectCountry() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.colorLight,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            title: Text(AppStrings.ulkeEkle, style: _dialogHeaderTextSyle),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.21,
              width: MediaQuery.of(context).size.width * 0.80,
              child: TypeAheadField(
                getImmediateSuggestions: true,
                itemBuilder: (BuildContext context, itemData) {},
                onSuggestionSelected: (suggestion) {},
                suggestionsCallback: (String pattern) {},
                textFieldConfiguration: TextFieldConfiguration(
                  autocorrect: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ülkeni ara',
                  ),
                ),
              ),
            ),
          );
        });
  }

  TextStyle get _dialogHeaderTextSyle => GoogleFonts.openSans(color: AppColors.colorDarkBlue, fontWeight: FontWeight.bold, fontSize: 19);
}
