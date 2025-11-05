// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modele.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModele _$HomeModeleFromJson(Map<String, dynamic> json) => HomeModele(
  flags: json['flags'] == null
      ? null
      : Flags.fromJson(json['flags'] as Map<String, dynamic>),
  coatOfArms: json['coatOfArms'] == null
      ? null
      : CoatOfArms.fromJson(json['coatOfArms'] as Map<String, dynamic>),
  name: json['name'] == null
      ? null
      : Name.fromJson(json['name'] as Map<String, dynamic>),
  cca3: json['cca3'] as String?,
  translations: (json['translations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, Translation.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$HomeModeleToJson(HomeModele instance) =>
    <String, dynamic>{
      'flags': instance.flags,
      'coatOfArms': instance.coatOfArms,
      'name': instance.name,
      'cca3': instance.cca3,
      'translations': instance.translations,
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
