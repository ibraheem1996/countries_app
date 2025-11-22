
import '../../domain/entities.dart';
import 'model.dart';

extension HomeModelMapper on HomeModel {
  Country toEntity() {
    return Country(
      name: name??"",
      flagPng: flags?.png,
      flagSvg: flags?.svg,
      cca3: alpha3Code??"",
      cca2: alpha2Code??"",
      region: region??"",
      subregion: subregion??"",
      capital: capital??"" ,
      languages: languages??[],
      callingCodes: callingCodes??[],
      



    );
  }
}
