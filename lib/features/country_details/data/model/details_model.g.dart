// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) => DetailsModel(
  name: Name.fromJson(json['name'] as Map<String, dynamic>),
  tld: (json['tld'] as List<dynamic>?)?.map((e) => e as String).toList(),
  cca2: json['cca2'] as String?,
  ccn3: json['ccn3'] as String?,
  cioc: json['cioc'] as String?,
  independent: json['independent'] as bool?,
  status: json['status'] as String?,
  unMember: json['unMember'] as bool?,
  currencies: json['currencies'] == null
      ? null
      : Currencies.fromJson(json['currencies'] as Map<String, dynamic>),
  idd: json['idd'] == null
      ? null
      : Idd.fromJson(json['idd'] as Map<String, dynamic>),
  capital: (json['capital'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  altSpellings: (json['altSpellings'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  region: json['region'] as String?,
  subregion: json['subregion'] as String?,
  languages: (json['languages'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  latlng: (json['latlng'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList(),
  landlocked: json['landlocked'] as bool?,
  borders: (json['borders'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  area: (json['area'] as num?)?.toDouble(),
  demonyms: json['demonyms'] == null
      ? null
      : Demonyms.fromJson(json['demonyms'] as Map<String, dynamic>),
  cca3: json['cca3'] as String?,
  translations: (json['translations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, Translation.fromJson(e as Map<String, dynamic>)),
  ),
  flag: json['flag'] as String?,
  maps: json['maps'] == null
      ? null
      : Maps.fromJson(json['maps'] as Map<String, dynamic>),
  population: (json['population'] as num?)?.toInt(),
  gini: (json['gini'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  fifa: json['fifa'] as String?,
  car: json['car'] == null
      ? null
      : Car.fromJson(json['car'] as Map<String, dynamic>),
  timezones: (json['timezones'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  continents: (json['continents'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  flags: json['flags'] == null
      ? null
      : Flags.fromJson(json['flags'] as Map<String, dynamic>),
  coatOfArms: json['coatOfArms'] == null
      ? null
      : CoatOfArms.fromJson(json['coatOfArms'] as Map<String, dynamic>),
  startOfWeek: json['startOfWeek'] as String?,
  capitalInfo: json['capitalInfo'] == null
      ? null
      : CapitalInfo.fromJson(json['capitalInfo'] as Map<String, dynamic>),
  postalCode: json['postalCode'] == null
      ? null
      : PostalCode.fromJson(json['postalCode'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DetailsModelToJson(DetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tld': instance.tld,
      'cca2': instance.cca2,
      'ccn3': instance.ccn3,
      'cioc': instance.cioc,
      'independent': instance.independent,
      'status': instance.status,
      'unMember': instance.unMember,
      'currencies': instance.currencies,
      'idd': instance.idd,
      'capital': instance.capital,
      'altSpellings': instance.altSpellings,
      'region': instance.region,
      'subregion': instance.subregion,
      'languages': instance.languages,
      'latlng': instance.latlng,
      'landlocked': instance.landlocked,
      'borders': instance.borders,
      'area': instance.area,
      'demonyms': instance.demonyms,
      'cca3': instance.cca3,
      'translations': instance.translations,
      'flag': instance.flag,
      'maps': instance.maps,
      'population': instance.population,
      'gini': instance.gini,
      'fifa': instance.fifa,
      'car': instance.car,
      'timezones': instance.timezones,
      'continents': instance.continents,
      'flags': instance.flags,
      'coatOfArms': instance.coatOfArms,
      'startOfWeek': instance.startOfWeek,
      'capitalInfo': instance.capitalInfo,
      'postalCode': instance.postalCode,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
  common: json['common'] as String?,
  official: json['official'] as String?,
  nativeName: (json['nativeName'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, NativeName.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
  'common': instance.common,
  'official': instance.official,
  'nativeName': instance.nativeName,
};

NativeName _$NativeNameFromJson(Map<String, dynamic> json) => NativeName(
  official: json['official'] as String?,
  common: json['common'] as String?,
);

Map<String, dynamic> _$NativeNameToJson(NativeName instance) =>
    <String, dynamic>{'official': instance.official, 'common': instance.common};

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation(
  official: json['official'] as String?,
  common: json['common'] as String?,
);

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{'official': instance.official, 'common': instance.common};

Currencies _$CurrenciesFromJson(Map<String, dynamic> json) => Currencies(
  currencies: (json['currencies'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, CurrencyDetail.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$CurrenciesToJson(Currencies instance) =>
    <String, dynamic>{'currencies': instance.currencies};

CurrencyDetail _$CurrencyDetailFromJson(Map<String, dynamic> json) =>
    CurrencyDetail(
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$CurrencyDetailToJson(CurrencyDetail instance) =>
    <String, dynamic>{'name': instance.name, 'symbol': instance.symbol};

Idd _$IddFromJson(Map<String, dynamic> json) => Idd(
  root: json['root'] as String?,
  suffixes: (json['suffixes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$IddToJson(Idd instance) => <String, dynamic>{
  'root': instance.root,
  'suffixes': instance.suffixes,
};

Demonyms _$DemonymsFromJson(Map<String, dynamic> json) => Demonyms(
  eng: json['eng'] == null
      ? null
      : Eng.fromJson(json['eng'] as Map<String, dynamic>),
  fra: json['fra'] == null
      ? null
      : Fra.fromJson(json['fra'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DemonymsToJson(Demonyms instance) => <String, dynamic>{
  'eng': instance.eng,
  'fra': instance.fra,
};

Eng _$EngFromJson(Map<String, dynamic> json) =>
    Eng(f: json['f'] as String?, m: json['m'] as String?);

Map<String, dynamic> _$EngToJson(Eng instance) => <String, dynamic>{
  'f': instance.f,
  'm': instance.m,
};

Fra _$FraFromJson(Map<String, dynamic> json) =>
    Fra(f: json['f'] as String?, m: json['m'] as String?);

Map<String, dynamic> _$FraToJson(Fra instance) => <String, dynamic>{
  'f': instance.f,
  'm': instance.m,
};

Maps _$MapsFromJson(Map<String, dynamic> json) => Maps(
  googleMaps: json['googleMaps'] as String?,
  openStreetMaps: json['openStreetMaps'] as String?,
);

Map<String, dynamic> _$MapsToJson(Maps instance) => <String, dynamic>{
  'googleMaps': instance.googleMaps,
  'openStreetMaps': instance.openStreetMaps,
};

Car _$CarFromJson(Map<String, dynamic> json) => Car(
  signs: (json['signs'] as List<dynamic>?)?.map((e) => e as String).toList(),
  side: json['side'] as String?,
);

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
  'signs': instance.signs,
  'side': instance.side,
};

Flags _$FlagsFromJson(Map<String, dynamic> json) => Flags(
  png: json['png'] as String?,
  svg: json['svg'] as String?,
  alt: json['alt'] as String?,
);

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
  'png': instance.png,
  'svg': instance.svg,
  'alt': instance.alt,
};

CoatOfArms _$CoatOfArmsFromJson(Map<String, dynamic> json) =>
    CoatOfArms(png: json['png'] as String?, svg: json['svg'] as String?);

Map<String, dynamic> _$CoatOfArmsToJson(CoatOfArms instance) =>
    <String, dynamic>{'png': instance.png, 'svg': instance.svg};

CapitalInfo _$CapitalInfoFromJson(Map<String, dynamic> json) => CapitalInfo(
  latlng: (json['latlng'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$CapitalInfoToJson(CapitalInfo instance) =>
    <String, dynamic>{'latlng': instance.latlng};

PostalCode _$PostalCodeFromJson(Map<String, dynamic> json) => PostalCode(
  format: json['format'] as String?,
  regex: json['regex'] as String?,
);

Map<String, dynamic> _$PostalCodeToJson(PostalCode instance) =>
    <String, dynamic>{'format': instance.format, 'regex': instance.regex};
