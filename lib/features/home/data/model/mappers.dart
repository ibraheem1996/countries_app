import '../../domain/entities/entities.dart';
import 'model.dart';

extension HomeModelMapper on HomeModel {
  Country toEntity() {
    String finalName = "";
    if (name is Map<String, dynamic>) {
      finalName = name["common"] ?? "";
    } else if (name is String) {
      finalName = name;
    }

    String finalCapital = "";
    if (capital is List && capital.isNotEmpty) {
      finalCapital = capital.first.toString();
    } else if (capital is String) {
      finalCapital = capital;
    }

    List<Map<String, String>> finalLanguages = [];

    if (languages is Map) {
      languages.forEach((k, v) {
        finalLanguages.add({k.toString(): v.toString()});
      });
    } else if (languages is List) {
      for (var lang in languages) {
        if (lang is Map) {
          lang.forEach((k, v) {
            finalLanguages.add({k.toString(): v.toString()});
          });
        }
      }
    }

    List<String> finalCallingCodes = [];

    if (idd is Map && idd["root"] != null && idd["suffixes"] is List) {
      final root = idd["root"];
      for (var s in idd["suffixes"]) {
        finalCallingCodes.add("$root$s");
      }
    }

    return Country(
      name: finalName,
      capital: finalCapital,
      flagPng: flags?.png,
      flagSvg: flags?.svg,
      cca2: cca2 ?? "",
      cca3: cca3 ?? "",
      region: region ?? "",
      subregion: subregion ?? "",
      languages: finalLanguages,
      callingCodes: finalCallingCodes,
    );
  }
}
