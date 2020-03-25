// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalData _$GlobalDataFromJson(Map<String, dynamic> json) {
  return GlobalData(
    (json['total_cases'] as num)?.toDouble(),
    (json['total_recovered'] as num)?.toDouble(),
    (json['total_deaths'] as num)?.toDouble(),
    (json['total_active_Cases'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$GlobalDataToJson(GlobalData instance) => <String, dynamic>{
      'total_cases': instance.totalCases,
      'total_recovered': instance.totalRecovered,
      'total_deaths': instance.totalDeaths,
      'total_active_Cases': instance.activeCases,
    };
