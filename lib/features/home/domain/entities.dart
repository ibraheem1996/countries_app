class Country {
  final String? nameCommon;
  final String? nameOfficial;
  final String? flagPng;
  final String? flagSvg;
  final String? cca2;
  final String? cca3;
  final String? region;
  final String? subregion;
  final List<String> capital; 
  final List<String> languages; 
  final bool? independent;
  final int? population;
  final double? area;
  final String? phoneRoot; 
  final List<String> phoneSuffixes; 

  const Country({
    this.nameCommon,
    this.nameOfficial,
    this.flagPng,
    this.flagSvg,
    this.cca2,
    this.cca3,
    this.region,
    this.subregion,
    this.capital = const [],
    this.languages = const [],
    this.independent,
    this.population,
    this.area,
    this.phoneRoot,
    this.phoneSuffixes = const [],
  });
}
