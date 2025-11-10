import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

@freezed
abstract  class Country with _$Country {
  const factory Country({
    String? nameCommon,
    String? nameOfficial,
    String? flagPng,
    String? flagSvg,
    String? cca2,
    String? cca3,
    String? region,
    String? subregion,
    @Default([]) List<String> capital,
    @Default([]) List<String> languages,
    bool? independent,
    int? population,
    double? area,
    String? phoneRoot,
    @Default([]) List<String> phoneSuffixes,
  }) = _Country;
}
