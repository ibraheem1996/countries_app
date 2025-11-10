// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Country {

 String? get nameCommon; String? get nameOfficial; String? get flagPng; String? get flagSvg; String? get cca2; String? get cca3; String? get region; String? get subregion; List<String> get capital; List<String> get languages; bool? get independent; int? get population; double? get area; String? get phoneRoot; List<String> get phoneSuffixes;
/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryCopyWith<Country> get copyWith => _$CountryCopyWithImpl<Country>(this as Country, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Country&&(identical(other.nameCommon, nameCommon) || other.nameCommon == nameCommon)&&(identical(other.nameOfficial, nameOfficial) || other.nameOfficial == nameOfficial)&&(identical(other.flagPng, flagPng) || other.flagPng == flagPng)&&(identical(other.flagSvg, flagSvg) || other.flagSvg == flagSvg)&&(identical(other.cca2, cca2) || other.cca2 == cca2)&&(identical(other.cca3, cca3) || other.cca3 == cca3)&&(identical(other.region, region) || other.region == region)&&(identical(other.subregion, subregion) || other.subregion == subregion)&&const DeepCollectionEquality().equals(other.capital, capital)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.independent, independent) || other.independent == independent)&&(identical(other.population, population) || other.population == population)&&(identical(other.area, area) || other.area == area)&&(identical(other.phoneRoot, phoneRoot) || other.phoneRoot == phoneRoot)&&const DeepCollectionEquality().equals(other.phoneSuffixes, phoneSuffixes));
}


@override
int get hashCode => Object.hash(runtimeType,nameCommon,nameOfficial,flagPng,flagSvg,cca2,cca3,region,subregion,const DeepCollectionEquality().hash(capital),const DeepCollectionEquality().hash(languages),independent,population,area,phoneRoot,const DeepCollectionEquality().hash(phoneSuffixes));

@override
String toString() {
  return 'Country(nameCommon: $nameCommon, nameOfficial: $nameOfficial, flagPng: $flagPng, flagSvg: $flagSvg, cca2: $cca2, cca3: $cca3, region: $region, subregion: $subregion, capital: $capital, languages: $languages, independent: $independent, population: $population, area: $area, phoneRoot: $phoneRoot, phoneSuffixes: $phoneSuffixes)';
}


}

/// @nodoc
abstract mixin class $CountryCopyWith<$Res>  {
  factory $CountryCopyWith(Country value, $Res Function(Country) _then) = _$CountryCopyWithImpl;
@useResult
$Res call({
 String? nameCommon, String? nameOfficial, String? flagPng, String? flagSvg, String? cca2, String? cca3, String? region, String? subregion, List<String> capital, List<String> languages, bool? independent, int? population, double? area, String? phoneRoot, List<String> phoneSuffixes
});




}
/// @nodoc
class _$CountryCopyWithImpl<$Res>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._self, this._then);

  final Country _self;
  final $Res Function(Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nameCommon = freezed,Object? nameOfficial = freezed,Object? flagPng = freezed,Object? flagSvg = freezed,Object? cca2 = freezed,Object? cca3 = freezed,Object? region = freezed,Object? subregion = freezed,Object? capital = null,Object? languages = null,Object? independent = freezed,Object? population = freezed,Object? area = freezed,Object? phoneRoot = freezed,Object? phoneSuffixes = null,}) {
  return _then(_self.copyWith(
nameCommon: freezed == nameCommon ? _self.nameCommon : nameCommon // ignore: cast_nullable_to_non_nullable
as String?,nameOfficial: freezed == nameOfficial ? _self.nameOfficial : nameOfficial // ignore: cast_nullable_to_non_nullable
as String?,flagPng: freezed == flagPng ? _self.flagPng : flagPng // ignore: cast_nullable_to_non_nullable
as String?,flagSvg: freezed == flagSvg ? _self.flagSvg : flagSvg // ignore: cast_nullable_to_non_nullable
as String?,cca2: freezed == cca2 ? _self.cca2 : cca2 // ignore: cast_nullable_to_non_nullable
as String?,cca3: freezed == cca3 ? _self.cca3 : cca3 // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,subregion: freezed == subregion ? _self.subregion : subregion // ignore: cast_nullable_to_non_nullable
as String?,capital: null == capital ? _self.capital : capital // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,independent: freezed == independent ? _self.independent : independent // ignore: cast_nullable_to_non_nullable
as bool?,population: freezed == population ? _self.population : population // ignore: cast_nullable_to_non_nullable
as int?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double?,phoneRoot: freezed == phoneRoot ? _self.phoneRoot : phoneRoot // ignore: cast_nullable_to_non_nullable
as String?,phoneSuffixes: null == phoneSuffixes ? _self.phoneSuffixes : phoneSuffixes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Country].
extension CountryPatterns on Country {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Country value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Country value)  $default,){
final _that = this;
switch (_that) {
case _Country():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Country value)?  $default,){
final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? nameCommon,  String? nameOfficial,  String? flagPng,  String? flagSvg,  String? cca2,  String? cca3,  String? region,  String? subregion,  List<String> capital,  List<String> languages,  bool? independent,  int? population,  double? area,  String? phoneRoot,  List<String> phoneSuffixes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.nameCommon,_that.nameOfficial,_that.flagPng,_that.flagSvg,_that.cca2,_that.cca3,_that.region,_that.subregion,_that.capital,_that.languages,_that.independent,_that.population,_that.area,_that.phoneRoot,_that.phoneSuffixes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? nameCommon,  String? nameOfficial,  String? flagPng,  String? flagSvg,  String? cca2,  String? cca3,  String? region,  String? subregion,  List<String> capital,  List<String> languages,  bool? independent,  int? population,  double? area,  String? phoneRoot,  List<String> phoneSuffixes)  $default,) {final _that = this;
switch (_that) {
case _Country():
return $default(_that.nameCommon,_that.nameOfficial,_that.flagPng,_that.flagSvg,_that.cca2,_that.cca3,_that.region,_that.subregion,_that.capital,_that.languages,_that.independent,_that.population,_that.area,_that.phoneRoot,_that.phoneSuffixes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? nameCommon,  String? nameOfficial,  String? flagPng,  String? flagSvg,  String? cca2,  String? cca3,  String? region,  String? subregion,  List<String> capital,  List<String> languages,  bool? independent,  int? population,  double? area,  String? phoneRoot,  List<String> phoneSuffixes)?  $default,) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.nameCommon,_that.nameOfficial,_that.flagPng,_that.flagSvg,_that.cca2,_that.cca3,_that.region,_that.subregion,_that.capital,_that.languages,_that.independent,_that.population,_that.area,_that.phoneRoot,_that.phoneSuffixes);case _:
  return null;

}
}

}

/// @nodoc


class _Country implements Country {
  const _Country({this.nameCommon, this.nameOfficial, this.flagPng, this.flagSvg, this.cca2, this.cca3, this.region, this.subregion, final  List<String> capital = const [], final  List<String> languages = const [], this.independent, this.population, this.area, this.phoneRoot, final  List<String> phoneSuffixes = const []}): _capital = capital,_languages = languages,_phoneSuffixes = phoneSuffixes;
  

@override final  String? nameCommon;
@override final  String? nameOfficial;
@override final  String? flagPng;
@override final  String? flagSvg;
@override final  String? cca2;
@override final  String? cca3;
@override final  String? region;
@override final  String? subregion;
 final  List<String> _capital;
@override@JsonKey() List<String> get capital {
  if (_capital is EqualUnmodifiableListView) return _capital;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_capital);
}

 final  List<String> _languages;
@override@JsonKey() List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

@override final  bool? independent;
@override final  int? population;
@override final  double? area;
@override final  String? phoneRoot;
 final  List<String> _phoneSuffixes;
@override@JsonKey() List<String> get phoneSuffixes {
  if (_phoneSuffixes is EqualUnmodifiableListView) return _phoneSuffixes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phoneSuffixes);
}


/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryCopyWith<_Country> get copyWith => __$CountryCopyWithImpl<_Country>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Country&&(identical(other.nameCommon, nameCommon) || other.nameCommon == nameCommon)&&(identical(other.nameOfficial, nameOfficial) || other.nameOfficial == nameOfficial)&&(identical(other.flagPng, flagPng) || other.flagPng == flagPng)&&(identical(other.flagSvg, flagSvg) || other.flagSvg == flagSvg)&&(identical(other.cca2, cca2) || other.cca2 == cca2)&&(identical(other.cca3, cca3) || other.cca3 == cca3)&&(identical(other.region, region) || other.region == region)&&(identical(other.subregion, subregion) || other.subregion == subregion)&&const DeepCollectionEquality().equals(other._capital, _capital)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.independent, independent) || other.independent == independent)&&(identical(other.population, population) || other.population == population)&&(identical(other.area, area) || other.area == area)&&(identical(other.phoneRoot, phoneRoot) || other.phoneRoot == phoneRoot)&&const DeepCollectionEquality().equals(other._phoneSuffixes, _phoneSuffixes));
}


@override
int get hashCode => Object.hash(runtimeType,nameCommon,nameOfficial,flagPng,flagSvg,cca2,cca3,region,subregion,const DeepCollectionEquality().hash(_capital),const DeepCollectionEquality().hash(_languages),independent,population,area,phoneRoot,const DeepCollectionEquality().hash(_phoneSuffixes));

@override
String toString() {
  return 'Country(nameCommon: $nameCommon, nameOfficial: $nameOfficial, flagPng: $flagPng, flagSvg: $flagSvg, cca2: $cca2, cca3: $cca3, region: $region, subregion: $subregion, capital: $capital, languages: $languages, independent: $independent, population: $population, area: $area, phoneRoot: $phoneRoot, phoneSuffixes: $phoneSuffixes)';
}


}

/// @nodoc
abstract mixin class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) _then) = __$CountryCopyWithImpl;
@override @useResult
$Res call({
 String? nameCommon, String? nameOfficial, String? flagPng, String? flagSvg, String? cca2, String? cca3, String? region, String? subregion, List<String> capital, List<String> languages, bool? independent, int? population, double? area, String? phoneRoot, List<String> phoneSuffixes
});




}
/// @nodoc
class __$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(this._self, this._then);

  final _Country _self;
  final $Res Function(_Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nameCommon = freezed,Object? nameOfficial = freezed,Object? flagPng = freezed,Object? flagSvg = freezed,Object? cca2 = freezed,Object? cca3 = freezed,Object? region = freezed,Object? subregion = freezed,Object? capital = null,Object? languages = null,Object? independent = freezed,Object? population = freezed,Object? area = freezed,Object? phoneRoot = freezed,Object? phoneSuffixes = null,}) {
  return _then(_Country(
nameCommon: freezed == nameCommon ? _self.nameCommon : nameCommon // ignore: cast_nullable_to_non_nullable
as String?,nameOfficial: freezed == nameOfficial ? _self.nameOfficial : nameOfficial // ignore: cast_nullable_to_non_nullable
as String?,flagPng: freezed == flagPng ? _self.flagPng : flagPng // ignore: cast_nullable_to_non_nullable
as String?,flagSvg: freezed == flagSvg ? _self.flagSvg : flagSvg // ignore: cast_nullable_to_non_nullable
as String?,cca2: freezed == cca2 ? _self.cca2 : cca2 // ignore: cast_nullable_to_non_nullable
as String?,cca3: freezed == cca3 ? _self.cca3 : cca3 // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,subregion: freezed == subregion ? _self.subregion : subregion // ignore: cast_nullable_to_non_nullable
as String?,capital: null == capital ? _self._capital : capital // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,independent: freezed == independent ? _self.independent : independent // ignore: cast_nullable_to_non_nullable
as bool?,population: freezed == population ? _self.population : population // ignore: cast_nullable_to_non_nullable
as int?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double?,phoneRoot: freezed == phoneRoot ? _self.phoneRoot : phoneRoot // ignore: cast_nullable_to_non_nullable
as String?,phoneSuffixes: null == phoneSuffixes ? _self._phoneSuffixes : phoneSuffixes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
