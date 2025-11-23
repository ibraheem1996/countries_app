import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

@freezed
abstract class Country with _$Country {
  const factory Country({
    @Default('') String name,
    @Default('') String capital,
    String? flagPng,
    String? flagSvg,
    @Default('') String cca2,
    @Default('') String cca3,
    @Default('') String region,
    @Default('') String subregion,
   @Default([])  List<Map<String,String>> languages,
  @Default([])  List<String> callingCodes

  }) = _Country;
}
