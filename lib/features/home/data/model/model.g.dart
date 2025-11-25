// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  name: json['name'],
  capital: json['capital'],
  flags: json['flags'] == null
      ? null
      : Flags.fromJson(json['flags'] as Map<String, dynamic>),
  cca2: json['cca2'] as String?,
  cca3: json['cca3'] as String?,
  region: json['region'] as String?,
  subregion: json['subregion'] as String?,
  languages: json['languages'],
  idd: json['idd'],
);

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
  'name': instance.name,
  'capital': instance.capital,
  'flags': instance.flags,
  'cca2': instance.cca2,
  'cca3': instance.cca3,
  'region': instance.region,
  'subregion': instance.subregion,
  'languages': instance.languages,
  'idd': instance.idd,
};

Flags _$FlagsFromJson(Map<String, dynamic> json) =>
    Flags(png: json['png'] as String?, svg: json['svg'] as String?);

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
  'png': instance.png,
  'svg': instance.svg,
};
