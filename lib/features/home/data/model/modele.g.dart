// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modele.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  json['idd'] == null
      ? null
      : Idd.fromJson(json['idd'] as Map<String, dynamic>),
  name: json['name'] == null
      ? null
      : Name.fromJson(json['name'] as Map<String, dynamic>),
  flags: json['flags'] == null
      ? null
      : Flags.fromJson(json['flags'] as Map<String, dynamic>),
  cca2: json['cca2'] as String?,
  cca3: json['cca3'] as String?,
  region: json['region'] as String?,
  subregion: json['subregion'] as String?,
  capital: (json['capital'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  languages: (json['languages'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  independent: json['independent'] as bool?,
  population: (json['population'] as num?)?.toInt(),
  area: (json['area'] as num?)?.toDouble(),
);

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
  'name': instance.name,
  'flags': instance.flags,
  'cca2': instance.cca2,
  'cca3': instance.cca3,
  'region': instance.region,
  'subregion': instance.subregion,
  'capital': instance.capital,
  'languages': instance.languages,
  'independent': instance.independent,
  'population': instance.population,
  'area': instance.area,
  'idd': instance.idd,
};

Name _$NameFromJson(Map<String, dynamic> json) => Name(
  common: json['common'] as String?,
  official: json['official'] as String?,
  nativeName: (json['nativeName'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, NativeName.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
  'common': instance.common,
  'official': instance.official,
  'nativeName': instance.nativeName,
};

NativeName _$NativeNameFromJson(Map<String, dynamic> json) => NativeName(
  official: json['official'] as String?,
  common: json['common'] as String?,
);

Map<String, dynamic> _$NativeNameToJson(NativeName instance) =>
    <String, dynamic>{'official': instance.official, 'common': instance.common};

Flags _$FlagsFromJson(Map<String, dynamic> json) => Flags(
  png: json['png'] as String?,
  svg: json['svg'] as String?,
  alt: json['alt'] as String?,
);

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
  'png': instance.png,
  'svg': instance.svg,
  'alt': instance.alt,
};

Idd _$IddFromJson(Map<String, dynamic> json) => Idd(
  root: json['root'] as String?,
  suffixes: (json['suffixes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$IddToJson(Idd instance) => <String, dynamic>{
  'root': instance.root,
  'suffixes': instance.suffixes,
};
