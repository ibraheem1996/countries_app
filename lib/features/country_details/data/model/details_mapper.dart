import '../../doman/entities.dart';
import 'details_model.dart';

extension DetailsMapper on DetailsModel {
  CountryDetailsEntities toEntity() {
    final currencyMap = (() {
      try {
        final map = currencies;
        if (map != null && map.isNotEmpty) {
          CurrencyDetail? first;
          for (final v in map.values) {
            if (v.name != null || v.symbol != null) {
              first = v;
              break;
            }
          }

          if (first != null) {
            return {'name': first.name, 'symbol': first.symbol};
          }
        }
      } catch (_) {}
      return null;
    })();

    return CountryDetailsEntities(
      
      nameCommon: name.common ?? '',
      nameOfficial: name.official ?? '',
      cca2: cca2 ?? '',
      cca3: cca3 ?? '',
      ccn3: ccn3 ?? '',
      cioc: cioc ?? '',
      independent: independent ?? false,
      status: status ?? '',
      unMember: unMember ?? false,
      region: region ?? '',
      subregion: subregion ?? '',
      flag: flag ,
      flagPng: flags?.png ,
      flagSvg: flags?.svg ,
      flagAlt: flags?.alt ,
      coatPng: coatOfArms?.png ,
      coatSvg: coatOfArms?.svg ,
      population: population ?? 0,
      area: area ?? 0.0,
      startOfWeek: startOfWeek ?? '',

      capital: capital ?? [],
      altSpellings: altSpellings ?? [],
      languages: languages ?? {},
      borders: borders ?? [],
      timezones: timezones ?? [],
      continents: continents ?? [],

      translations:
          translations?.map(
            (key, value) =>
                MapEntry(key, {'official': value.official ?? '', 'common': value.common ?? ''}),
          ) ??
          {},

      root: idd?.root ?? '',
      suffixes: idd?.suffixes ?? [],

      googleMapsUrl: maps?.googleMaps ?? '',
      openStreetMapsUrl: maps?.openStreetMaps ?? '',

      carSide: car?.side ?? '',
      carSigns: car?.signs ?? [],

      currencyName: currencyMap?['name'] ?? '',
      currencySymbol: currencyMap?['symbol'] ?? '',

      demonymMaleEng: demonyms?.eng?.m ?? '',
      demonymFemaleEng: demonyms?.eng?.f ?? '',
      demonymMaleFra: demonyms?.fra?.m ?? '',
      demonymFemaleFra: demonyms?.fra?.f ?? '',

      latlng: latlng ?? [],
     
      landlocked: landlocked ?? false,

      postalFormat: postalCode?.format ?? '',
      postalRegex: postalCode?.regex ?? '',

      fifa: fifa ?? '',
      tld: tld ?? [],
    );
  }
}
