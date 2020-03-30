import 'package:covid_19_tracker_in_flutter/models/result.dart';
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
  final TextEditingController _typeAheadController = TextEditingController();

  List<CountryResult> countryResult = [];
  String _selectedCountry = "";
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    List<CountryResult> _countryTemp = await getAllCountriesData();
    setState(() {
      countryResult = _countryTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
          _showSelectCountry(countryResult);
        },
        tooltip: AppStrings.ulkeEkle,
        child: FaIcon(FontAwesomeIcons.plus),
        backgroundColor: AppColors.colorDarkBlue,
      ),
      body: Column(children: <Widget>[]),
    );
  }

  List<String> getSuggestions(String query) {
    List<String> countries = List();
    countryResult.forEach((element) {
      countries.add(element.countryName);
    });
    countries.sort();
    countries.retainWhere((element) => element.toLowerCase().contains(query.toLowerCase()));
    return countries;
  }

  void _showSelectCountry(List<CountryResult> _countryResult) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.colorLight,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            title: Text(AppStrings.ulkeEkle, style: _dialogHeaderTextStyle),
            content: Form(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.21,
                width: MediaQuery.of(context).size.width * 0.80,
                child: Column(
                  children: <Widget>[
                    TypeAheadFormField(
                      getImmediateSuggestions: true,
                      itemBuilder: (context, suggestion) {
                        return Card(
                          child: ListTile(
                            // TODO Bayrak iconları ekle
                            //leading: Icon(Icons.shopping_cart),
                            title: Text(suggestion),
                          ),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        this._typeAheadController.text = suggestion;
                        this._selectedCountry = suggestion;
                      },
                      errorBuilder: (context, Object error) {
                        return Text("Ülke Bulunamadı");
                      },
                      noItemsFoundBuilder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Ülke Bulunamadı",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Theme.of(context).disabledColor, fontSize: 18.0),
                          ),
                        );
                      },
                      suggestionsCallback: (pattern) {
                        return getSuggestions(pattern);
                      },
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: this._typeAheadController,
                        cursorColor: AppColors.colorDarkBlue,
                        autocorrect: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          filled: true,
                          fillColor: AppColors.colorBlue,
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Ülkeni ara',
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ülkeni ara';
                        }
                      },
                      onSaved: (value) => this._selectedCountry = value,
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                            child: Text("İptal", style: _dialogButtonTextStyle(AppColors.colorPrimary)),
                            onPressed: () {
                              Navigator.pop(context);
                              _typeAheadController.text = "";
                            }),
                        FlatButton(
                          color: AppColors.colorBlue,
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                          child: Text("Ekle", style: _dialogButtonTextStyle(AppColors.colorDarkBlue)),
                          onPressed: () {
                            print(_selectedCountry);
                            _typeAheadController.text = "";
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  TextStyle get _dialogHeaderTextStyle => GoogleFonts.openSans(color: AppColors.colorDarkBlue, fontWeight: FontWeight.bold, fontSize: 19);
  TextStyle _dialogButtonTextStyle(Color _color) => GoogleFonts.openSans(color: _color, fontWeight: FontWeight.bold, fontSize: 11);
}
