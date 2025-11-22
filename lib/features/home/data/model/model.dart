import 'package:freezed_annotation/freezed_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class HomeModel {
  final String? name;

  final String? capital;

  final Flags? flags;

  final String? alpha2Code;

  final String? alpha3Code;

  final String? region;

  final String? subregion;


  final List<Map<String,String>>? languages;

  final List<String>? callingCodes;

  HomeModel({
    this.name,
    this.flags,
    this.alpha2Code,
    this.alpha3Code,
    this.region,
    this.subregion,
    this.capital,
    this.languages,
    this.callingCodes,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

// -------------------- Flags --------------------
@JsonSerializable()
class Flags {
  final String? png;
  final String? svg;

  Flags({this.png, this.svg});

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
  Map<String, dynamic> toJson() => _$FlagsToJson(this);
}
