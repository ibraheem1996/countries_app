import 'package:freezed_annotation/freezed_annotation.dart';
part 'modele.g.dart';

@JsonSerializable()
class HomeModele {
  final Flags? flags;
  final CoatOfArms? coatOfArms;
  final Name? name;
  final String? cca3;
  final Map<String, Translation>? translations;

  HomeModele({this.flags, this.coatOfArms, this.name, this.cca3, this.translations});

  factory HomeModele.fromJson(Map<String, dynamic> json) => _$HomeModeleFromJson(json);
}

// ----------------------------------------------------------

@JsonSerializable()
class Flags {
  final String? png;
  final String? svg;
  final String? alt;

  Flags({this.png, this.svg, this.alt});

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
}

// ----------------------------------------------------------

@JsonSerializable()
class CoatOfArms {
  final String? png;
  final String? svg;

  CoatOfArms({this.png, this.svg});

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => _$CoatOfArmsFromJson(json);
}

// ----------------------------------------------------------

@JsonSerializable()
class Name {
  final String? common;
  final String? official;
  final Map<String, NativeName>? nativeName;

  Name({this.common, this.official, this.nativeName});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}

// ----------------------------------------------------------

@JsonSerializable()
class NativeName {
  final String? official;
  final String? common;

  NativeName({this.official, this.common});

  factory NativeName.fromJson(Map<String, dynamic> json) => _$NativeNameFromJson(json);
}

// ----------------------------------------------------------

@JsonSerializable()
class Translation {
  final String? official;
  final String? common;

  Translation({this.official, this.common});

  factory Translation.fromJson(Map<String, dynamic> json) => _$TranslationFromJson(json);
}
