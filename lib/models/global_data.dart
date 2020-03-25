import 'package:json_annotation/json_annotation.dart';

part 'global_data.g.dart';

@JsonSerializable()
class GlobalData extends Object {
  final double totalCases;
  final double totalRecovered;
  final double totalDeaths;
  final double activeCases;

  GlobalData(this.totalCases, this.totalRecovered, this.totalDeaths, this.activeCases);

  factory GlobalData.fromJson(Map<String, dynamic> json) => _$GlobalDataFromJson(json);
  
}
