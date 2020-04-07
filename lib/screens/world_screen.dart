import 'package:covid_19_tracker_in_flutter/models/result.dart';
import 'package:covid_19_tracker_in_flutter/state/world_state.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/country_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorldScreen extends StatefulWidget {
  @override
  _WorldScreenState createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {
  final TextEditingController _typeAheadController = TextEditingController();
  List<CountryResult> countryResult = [];
  String _selectedCountry = "";
  List<Widget> widgetList = [];
  int _widgetSayac = 0;
  int index = 0;

  void getData() async {
    List<CountryResult> _countryTemp = await getAllCountriesData();
    setState(() {
      countryResult = _countryTemp;
    });
  }

  void addCountry() {
    int _totalRecovered, _totalActiveCases, _totalDeaths, _totalCases;
    String _countryName;
    _widgetSayac++;
    countryResult.forEach((element) {
      if ((element.countryName) == _selectedCountry) {
        _totalRecovered = element.totalRecovered;
        _totalActiveCases = element.totalActiveCases;
        _totalDeaths = element.totalDeaths;
        _totalCases = element.totalCases;
        _countryName = element.countryName;
      }
    });
    widgetList.add(
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () => Navigator.pushReplacementNamed(context, AppStrings.pageCountryDetails, arguments: {"countryResults": countryResult[index]}),
          child: CountryStatus(
            totalRecovered: _totalRecovered,
            totalActiveCases: _totalActiveCases,
            totalDeaths: _totalDeaths,
            totalCases: _totalCases,
            countryName: _countryName,
          ),
        ),
      ),
    );
    _typeAheadController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getData();
            _showSelectCountry(countryResult);
          },
          tooltip: AppStrings.ulkeEkle,
          child: FaIcon(FontAwesomeIcons.plus),
          backgroundColor: AppColors.colorDarkBlue,
        ),
        body: ListView.builder(
          itemCount: _widgetSayac,
          itemBuilder: (context, int index) {
            return widgetList[index];
          },
        ),
      ),
      providers: [
        ChangeNotifierProvider<ChangeNotifier>(create: (context) => WorldState()),
      ],
    );
  }

  List<String> getSuggestions(String query) {
    List<String> countries = List();
    countryResult.forEach((element) {
      countries.add(element.countryName);
    });
    //countries.sort();
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
                      itemBuilder: (context, suggestion) => Card(child: ListTile(title: Text(suggestion))),
                      onSuggestionSelected: (suggestion) {
                        this._typeAheadController.text = suggestion;
                        this._selectedCountry = suggestion;
                      },
                      errorBuilder: (context, Object error) => Text("Ülke Bulunamadı"),
                      noItemsFoundBuilder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Ülke Bulunamadı", textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).disabledColor, fontSize: 18.0)),
                        );
                      },
                      suggestionsCallback: (pattern) => getSuggestions(pattern),
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
                      onSaved: (value) => this._selectedCountry = value,
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                            shape: _buttonStyle,
                            child: Text("İptal", style: _dialogButtonTextStyle(AppColors.colorPrimary)),
                            onPressed: () {
                              Navigator.pop(context);
                              _typeAheadController.text = "";
                            }),
                        FlatButton(
                          color: AppColors.colorBlue,
                          shape: _buttonStyle,
                          child: Text("Ekle", style: _dialogButtonTextStyle(AppColors.colorDarkBlue)),
                          onPressed: () {
                            if (_typeAheadController.text != "") addCountry();
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
  RoundedRectangleBorder get _buttonStyle => RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0));
}
