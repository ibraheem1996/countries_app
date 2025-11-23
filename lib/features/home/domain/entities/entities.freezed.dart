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

 String get name; String get capital; String? get flagPng; String? get flagSvg; String get cca2; String get cca3; String get region; String get subregion; List<Map<String, String>> get languages; List<String> get callingCodes;
/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryCopyWith<Country> get copyWith => _$CountryCopyWithImpl<Country>(this as Country, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Country&&(identical(other.name, name) || other.name == name)&&(identical(other.capital, capital) || other.capital == capital)&&(identical(other.flagPng, flagPng) || other.flagPng == flagPng)&&(identical(other.flagSvg, flagSvg) || other.flagSvg == flagSvg)&&(identical(other.cca2, cca2) || other.cca2 == cca2)&&(identical(other.cca3, cca3) || other.cca3 == cca3)&&(identical(other.region, region) || other.region == region)&&(identical(other.subregion, subregion) || other.subregion == subregion)&&const DeepCollectionEquality().equals(other.languages, languages)&&const DeepCollectionEquality().equals(other.callingCodes, callingCodes));
}


@override
int get hashCode => Object.hash(runtimeType,name,capital,flagPng,flagSvg,cca2,cca3,region,subregion,const DeepCollectionEquality().hash(languages),const DeepCollectionEquality().hash(callingCodes));

@override
String toString() {
  return 'Country(name: $name, capital: $capital, flagPng: $flagPng, flagSvg: $flagSvg, cca2: $cca2, cca3: $cca3, region: $region, subregion: $subregion, languages: $languages, callingCodes: $callingCodes)';
}


}

/// @nodoc
abstract mixin class $CountryCopyWith<$Res>  {
  factory $CountryCopyWith(Country value, $Res Function(Country) _then) = _$CountryCopyWithImpl;
@useResult
$Res call({
 String name, String capital, String? flagPng, String? flagSvg, String cca2, String cca3, String region, String subregion, List<Map<String, String>> languages, List<String> callingCodes
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? capital = null,Object? flagPng = freezed,Object? flagSvg = freezed,Object? cca2 = null,Object? cca3 = null,Object? region = null,Object? subregion = null,Object? languages = null,Object? callingCodes = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,capital: null == capital ? _self.capital : capital // ignore: cast_nullable_to_non_nullable
as String,flagPng: freezed == flagPng ? _self.flagPng : flagPng // ignore: cast_nullable_to_non_nullable
as String?,flagSvg: freezed == flagSvg ? _self.flagSvg : flagSvg // ignore: cast_nullable_to_non_nullable
as String?,cca2: null == cca2 ? _self.cca2 : cca2 // ignore: cast_nullable_to_non_nullable
as String,cca3: null == cca3 ? _self.cca3 : cca3 // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,subregion: null == subregion ? _self.subregion : subregion // ignore: cast_nullable_to_non_nullable
as String,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,callingCodes: null == callingCodes ? _self.callingCodes : callingCodes // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String capital,  String? flagPng,  String? flagSvg,  String cca2,  String cca3,  String region,  String subregion,  List<Map<String, String>> languages,  List<String> callingCodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.name,_that.capital,_that.flagPng,_that.flagSvg,_that.cca2,_that.cca3,_that.region,_that.subregion,_that.languages,_that.callingCodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String capital,  String? flagPng,  String? flagSvg,  String cca2,  String cca3,  String region,  String subregion,  List<Map<String, String>> languages,  List<String> callingCodes)  $default,) {final _that = this;
switch (_that) {
case _Country():
return $default(_that.name,_that.capital,_that.flagPng,_that.flagSvg,_that.cca2,_that.cca3,_that.region,_that.subregion,_that.languages,_that.callingCodes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String capital,  String? flagPng,  String? flagSvg,  String cca2,  String cca3,  String region,  String subregion,  List<Map<String, String>> languages,  List<String> callingCodes)?  $default,) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.name,_that.capital,_that.flagPng,_that.flagSvg,_that.cca2,_that.cca3,_that.region,_that.subregion,_that.languages,_that.callingCodes);case _:
  return null;

}
}

}

/// @nodoc


class _Country implements Country {
  const _Country({this.name = '', this.capital = '', this.flagPng, this.flagSvg, this.cca2 = '', this.cca3 = '', this.region = '', this.subregion = '', final  List<Map<String, String>> languages = const [], final  List<String> callingCodes = const []}): _languages = languages,_callingCodes = callingCodes;
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String capital;
@override final  String? flagPng;
@override final  String? flagSvg;
@override@JsonKey() final  String cca2;
@override@JsonKey() final  String cca3;
@override@JsonKey() final  String region;
@override@JsonKey() final  String subregion;
 final  List<Map<String, String>> _languages;
@override@JsonKey() List<Map<String, String>> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

 final  List<String> _callingCodes;
@override@JsonKey() List<String> get callingCodes {
  if (_callingCodes is EqualUnmodifiableListView) return _callingCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_callingCodes);
}


/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryCopyWith<_Country> get copyWith => __$CountryCopyWithImpl<_Country>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Country&&(identical(other.name, name) || other.name == name)&&(identical(other.capital, capital) || other.capital == capital)&&(identical(other.flagPng, flagPng) || other.flagPng == flagPng)&&(identical(other.flagSvg, flagSvg) || other.flagSvg == flagSvg)&&(identical(other.cca2, cca2) || other.cca2 == cca2)&&(identical(other.cca3, cca3) || other.cca3 == cca3)&&(identical(other.region, region) || other.region == region)&&(identical(other.subregion, subregion) || other.subregion == subregion)&&const DeepCollectionEquality().equals(other._languages, _languages)&&const DeepCollectionEquality().equals(other._callingCodes, _callingCodes));
}


@override
int get hashCode => Object.hash(runtimeType,name,capital,flagPng,flagSvg,cca2,cca3,region,subregion,const DeepCollectionEquality().hash(_languages),const DeepCollectionEquality().hash(_callingCodes));

@override
String toString() {
  return 'Country(name: $name, capital: $capital, flagPng: $flagPng, flagSvg: $flagSvg, cca2: $cca2, cca3: $cca3, region: $region, subregion: $subregion, languages: $languages, callingCodes: $callingCodes)';
}


}

/// @nodoc
abstract mixin class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) _then) = __$CountryCopyWithImpl;
@override @useResult
$Res call({
 String name, String capital, String? flagPng, String? flagSvg, String cca2, String cca3, String region, String subregion, List<Map<String, String>> languages, List<String> callingCodes
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? capital = null,Object? flagPng = freezed,Object? flagSvg = freezed,Object? cca2 = null,Object? cca3 = null,Object? region = null,Object? subregion = null,Object? languages = null,Object? callingCodes = null,}) {
  return _then(_Country(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,capital: null == capital ? _self.capital : capital // ignore: cast_nullable_to_non_nullable
as String,flagPng: freezed == flagPng ? _self.flagPng : flagPng // ignore: cast_nullable_to_non_nullable
as String?,flagSvg: freezed == flagSvg ? _self.flagSvg : flagSvg // ignore: cast_nullable_to_non_nullable
as String?,cca2: null == cca2 ? _self.cca2 : cca2 // ignore: cast_nullable_to_non_nullable
as String,cca3: null == cca3 ? _self.cca3 : cca3 // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,subregion: null == subregion ? _self.subregion : subregion // ignore: cast_nullable_to_non_nullable
as String,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,callingCodes: null == callingCodes ? _self._callingCodes : callingCodes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
