import '../../doman/entities.dart';
import '../model/details_model.dart';

extension DetailsMapper on DetailsModel {
  CountryDetailsEntities toEntity() {
    return CountryDetailsEntities(
      nameCommon: name.common ?? '',
      nameOfficial: name.official,
      cca2: cca2,
      cca3: cca3,
      ccn3: ccn3,
      cioc: cioc,
      independent: independent,
      status: status,
      unMember: unMember,
      region: region,
      subregion: subregion,
      flag: flag,
      flagPng: flags?.png,
      flagSvg: flags?.svg,
      coatPng: coatOfArms?.png,
      coatSvg: coatOfArms?.svg,
      population: population,
      area: area,
      startOfWeek: startOfWeek,

      // ✅ Capitals
      capital: capital ?? [],

      altSpellings: altSpellings ?? [],
      languages: languages ?? {},
      borders: borders ?? [],
      timezones: timezones ?? [],
      continents: continents ?? [],
      translations: translations?.map(
        (key, value) =>
            MapEntry(key, {'official': value.official ?? '', 'common': value.common ?? ''}),
      ),

      // ✅ Idd
      root: idd?.root,
      suffixes: idd?.suffixes ?? [],

      // ✅ Maps
      googleMapsUrl: maps?.googleMaps,
      openStreetMapsUrl: maps?.openStreetMaps,

      // ✅ Car info
      carSide: car?.side,
      carSigns: car?.signs ?? [],

      currencyName: (currencies != null && currencies!.toJson().isNotEmpty)
          ? currencies!.toJson().values.first['name']
          : null,
      currencySymbol: (currencies != null && currencies!.toJson().isNotEmpty)
          ? currencies!.toJson().values.first['symbol']
          : null,

      // ✅ Demonyms
      demonymMaleEng: demonyms?.eng?.m,
      demonymFemaleEng: demonyms?.eng?.f,
      demonymMaleFra: demonyms?.fra?.m,
      demonymFemaleFra: demonyms?.fra?.f,

      // ✅ Coordinates
      latlng: latlng,
      capitalLatlng: capitalInfo?.latlng,
      landlocked: landlocked,

      // ✅ Others
      postalFormat: postalCode?.format,
      postalRegex: postalCode?.regex,
      gini: gini,
      fifa: fifa,
      tld: tld,
    );
  }
}
