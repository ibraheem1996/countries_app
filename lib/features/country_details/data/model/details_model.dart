import 'package:json_annotation/json_annotation.dart';

part 'details_model.g.dart';

@JsonSerializable()
class DetailsModel {
  final Name name;
  final List<String>? tld;
  final String? cca2;
  final String? ccn3;
  final String? cioc;
  final bool? independent;
  final String? status;
  final bool? unMember;
  final Currencies? currencies;
  final Idd? idd;
  final List<String>? capital;
  final List<String>? altSpellings;
  final String? region;
  final String? subregion;
  final Map<String, String>? languages;
  final List<double>? latlng;
  final bool? landlocked;
  final List<String>? borders;
  final double? area;
  final Demonyms? demonyms;
  final String? cca3;
  final Map<String, Translation>? translations;
  final String? flag;
  final Maps? maps;
  final int? population;
  final Map<String, double>? gini;
  final String? fifa;
  final Car? car;
  final List<String>? timezones;
  final List<String>? continents;
  final Flags? flags;
  final CoatOfArms? coatOfArms;
  final String? startOfWeek;
  final CapitalInfo? capitalInfo;
  final PostalCode? postalCode;

  DetailsModel({
    required this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.demonyms,
    this.cca3,
    this.translations,
    this.flag,
    this.maps,
    this.population,
    this.gini,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.postalCode,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => _$DetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsModelToJson(this);
}


@JsonSerializable()
class Name {
  final String? common;
  final String? official;
  final Map<String, NativeName>? nativeName;

  Name({this.common, this.official, this.nativeName});
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class NativeName {
  final String? official;
  final String? common;

  NativeName({this.official, this.common});
  factory NativeName.fromJson(Map<String, dynamic> json) => _$NativeNameFromJson(json);
  Map<String, dynamic> toJson() => _$NativeNameToJson(this);
}

@JsonSerializable()
class Translation {
  final String? official;
  final String? common;

  Translation({this.official, this.common});
  factory Translation.fromJson(Map<String, dynamic> json) => _$TranslationFromJson(json);
  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}

@JsonSerializable()
class Currencies {
  final Map<String, CurrencyDetail>? currencies;

  Currencies({this.currencies});
  factory Currencies.fromJson(Map<String, dynamic> json) => _$CurrenciesFromJson(json);
  Map<String, dynamic> toJson() => _$CurrenciesToJson(this);
}


@JsonSerializable()
class CurrencyDetail {
  final String? name;
  final String? symbol;

  CurrencyDetail({this.name, this.symbol});
  factory CurrencyDetail.fromJson(Map<String, dynamic> json) => _$CurrencyDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyDetailToJson(this);
}

@JsonSerializable()
class Idd {
  final String? root;
  final List<String>? suffixes;

  Idd({this.root, this.suffixes});
  factory Idd.fromJson(Map<String, dynamic> json) => _$IddFromJson(json);
  Map<String, dynamic> toJson() => _$IddToJson(this);
}

@JsonSerializable()
class Demonyms {
  final Eng? eng;
  final Fra? fra;

  Demonyms({this.eng, this.fra});
  factory Demonyms.fromJson(Map<String, dynamic> json) => _$DemonymsFromJson(json);
  Map<String, dynamic> toJson() => _$DemonymsToJson(this);
}

@JsonSerializable()
class Eng {
  final String? f;
  final String? m;

  Eng({this.f, this.m});
  factory Eng.fromJson(Map<String, dynamic> json) => _$EngFromJson(json);
  Map<String, dynamic> toJson() => _$EngToJson(this);
}

@JsonSerializable()
class Fra {
  final String? f;
  final String? m;

  Fra({this.f, this.m});
  factory Fra.fromJson(Map<String, dynamic> json) => _$FraFromJson(json);
  Map<String, dynamic> toJson() => _$FraToJson(this);
}

@JsonSerializable()
class Maps {
  final String? googleMaps;
  final String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});
  factory Maps.fromJson(Map<String, dynamic> json) => _$MapsFromJson(json);
  Map<String, dynamic> toJson() => _$MapsToJson(this);
}

@JsonSerializable()
class Car {
  final List<String>? signs;
  final String? side;

  Car({this.signs, this.side});
  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
  Map<String, dynamic> toJson() => _$CarToJson(this);
}

@JsonSerializable()
class Flags {
  final String? png;
  final String? svg;
  final String? alt;

  Flags({this.png, this.svg, this.alt});
  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
  Map<String, dynamic> toJson() => _$FlagsToJson(this);
}

@JsonSerializable()
class CoatOfArms {
  final String? png;
  final String? svg;

  CoatOfArms({this.png, this.svg});
  factory CoatOfArms.fromJson(Map<String, dynamic> json) => _$CoatOfArmsFromJson(json);
  Map<String, dynamic> toJson() => _$CoatOfArmsToJson(this);
}

@JsonSerializable()
class CapitalInfo {
  final List<double>? latlng;

  CapitalInfo({this.latlng});
  factory CapitalInfo.fromJson(Map<String, dynamic> json) => _$CapitalInfoFromJson(json);
  Map<String, dynamic> toJson() => _$CapitalInfoToJson(this);
}

@JsonSerializable()
class PostalCode {
  final String? format;
  final String? regex;

  PostalCode({this.format, this.regex});
  factory PostalCode.fromJson(Map<String, dynamic> json) => _$PostalCodeFromJson(json);
  Map<String, dynamic> toJson() => _$PostalCodeToJson(this);
}
