import 'package:freezed_annotation/freezed_annotation.dart';
part 'modele.g.dart';

@JsonSerializable()
class HomeModel {
  final Name? name;
  final Flags? flags;
  final String? cca2;
  final String? cca3;
  final String? region;
  final String? subregion;
  final List<String>? capital;
  final Map<String, String>? languages;
  final bool? independent;
  final int? population;
  final double? area;
   final Idd? idd;

  HomeModel(this.idd, {
    this.name,
    this.flags,
    this.cca2,
    this.cca3,
    this.region,
    this.subregion,
    this.capital,
    this.languages,
    this.independent,
    this.population,
    this.area,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
}

// -------------------- Name --------------------
@JsonSerializable()
class Name {
  final String? common;
  final String? official;
  final Map<String, NativeName>? nativeName;

  Name({this.common, this.official, this.nativeName});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}

// -------------------- NativeName --------------------
@JsonSerializable()
class NativeName {
  final String? official;
  final String? common;

  NativeName({this.official, this.common});

  factory NativeName.fromJson(Map<String, dynamic> json) => _$NativeNameFromJson(json);
}

// -------------------- Flags --------------------
@JsonSerializable()
class Flags {
  final String? png;
  final String? svg;
  final String? alt;

  Flags({this.png, this.svg, this.alt});

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
}

@JsonSerializable()
class Idd {
  final String? root;
  final List<String>? suffixes;

  Idd({this.root, this.suffixes});

  factory Idd.fromJson(Map<String, dynamic> json) => _$IddFromJson(json);
}
