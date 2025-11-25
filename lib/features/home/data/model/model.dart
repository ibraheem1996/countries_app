import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class HomeModel {
  final dynamic name; 
  final dynamic capital; 
  final Flags? flags;

  final String? cca2;
  final String? cca3;

  final String? region;
  final String? subregion;

  final dynamic languages; 
  final dynamic idd; 

  HomeModel({
    this.name,
    this.capital,
    this.flags,
    this.cca2,
    this.cca3,
    this.region,
    this.subregion,
    this.languages,
    this.idd,
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
