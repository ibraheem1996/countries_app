
import '../../domain/entities.dart';
import 'model.dart';

extension HomeModelMapper on HomeModel {
  Country toEntity() {
    return Country(
      nameCommon: name?.common,
      nameOfficial: name?.official,
      flagPng: flags?.png,
      flagSvg: flags?.svg,
      cca2: cca2,
      cca3: cca3,
      region: region,
      subregion: subregion,
      capital: (capital ?? []).whereType<String>().toList(),
      languages: (languages ?? {}).values.whereType<String>().toList(),
      independent: independent,
      population: population,
      area: area,
      phoneRoot: idd?.root,
      phoneSuffixes: (idd?.suffixes ?? []).whereType<String>().toList(),
    );
  }
}
