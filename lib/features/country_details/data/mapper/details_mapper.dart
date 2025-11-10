
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

      capital: (capital != null && capital!.isNotEmpty) ? capital!.first : null,
      altSpellings: altSpellings ?? [],
      languages: languages ?? {},
      borders: borders ?? [],
      timezones: timezones ?? [],
      continents: continents ?? [],

      root: idd?.root,
      suffixes: idd?.suffixes ?? [],

      googleMapsUrl: maps?.googleMaps,
      openStreetMapsUrl: maps?.openStreetMaps,

      carSide: car?.side,
      carSigns: car?.signs ?? [],

      currencyName: currencies?.syp?.name,
      currencySymbol: currencies?.syp?.symbol,

      demonymMaleEng: demonyms?.eng?.m,
      demonymFemaleEng: demonyms?.eng?.f,
      demonymMaleFra: demonyms?.fra?.m,
      demonymFemaleFra: demonyms?.fra?.f,

      latlng: latlng,
      capitalLatlng: capitalInfo?.latlng,

      landlocked: landlocked,

      postalFormat: postalCode?.format,
      postalRegex: postalCode?.regex,
    );
  }
}
