// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  name: json['name'] as String?,
  flags: json['flags'] == null
      ? null
      : Flags.fromJson(json['flags'] as Map<String, dynamic>),
  alpha2Code: json['alpha2Code'] as String?,
  alpha3Code: json['alpha3Code'] as String?,
  region: json['region'] as String?,
  subregion: json['subregion'] as String?,
  capital: json['capital'] as String?,
  languages: (json['languages'] as List<dynamic>?)
      ?.map((e) => Map<String, String>.from(e as Map))
      .toList(),
  callingCodes: (json['callingCodes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
  'name': instance.name,
  'capital': instance.capital,
  'flags': instance.flags,
  'alpha2Code': instance.alpha2Code,
  'alpha3Code': instance.alpha3Code,
  'region': instance.region,
  'subregion': instance.subregion,
  'languages': instance.languages,
  'callingCodes': instance.callingCodes,
};

Flags _$FlagsFromJson(Map<String, dynamic> json) =>
    Flags(png: json['png'] as String?, svg: json['svg'] as String?);

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
  'png': instance.png,
  'svg': instance.svg,
};
