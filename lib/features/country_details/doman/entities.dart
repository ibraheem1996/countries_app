import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

@freezed
abstract class CountryDetailsEntities with _$CountryDetailsEntities {
  const factory CountryDetailsEntities({
    required String nameCommon,
    String? nameOfficial,
    String? cca2,
    String? cca3,
    String? ccn3,
    String? cioc,
    bool? independent,
    String? status,
    bool? unMember,
    String? region,
    String? subregion,
    String? flag,
    String? flagPng,
    String? flagSvg,
    String? flagAlt,
    String? coatPng,
    String? coatSvg,
    int? population,
    double? area,
    String? startOfWeek,

    @Default([]) List<String> capital,

    @Default([]) List<String> altSpellings,
    @Default({}) Map<String, String> languages,
    @Default([]) List<String> borders,
    @Default([]) List<String> timezones,
    @Default([]) List<String> continents,

    Map<String, Map<String, String>>? translations,

    String? root,
    @Default([]) List<String> suffixes,

    String? googleMapsUrl,
    String? openStreetMapsUrl,

    String? carSide,
    @Default([]) List<String> carSigns,

    String? currencies,
    String? fifa,

    Map<String, double>? gini,
    List<String>? tld,

    String? currencyName,
    String? currencySymbol,

    String? demonymMaleEng,
    String? demonymFemaleEng,
    String? demonymMaleFra,
    String? demonymFemaleFra,

    List<double>? latlng,
    List<double>? capitalLatlng,
    bool? landlocked,

    String? postalFormat,
    String? postalRegex,
  }) = _CountryDetailsEntities;
}
