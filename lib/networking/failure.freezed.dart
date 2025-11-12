// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String get message; Icon? get icon;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,message,icon);

@override
String toString() {
  return 'Failure(message: $message, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message, Icon? icon
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? icon = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerFailure value)?  server,TResult Function( NetworkFailure value)?  network,TResult Function( UnexpectedFailure value)?  unexpected,TResult Function( DataFailure value)?  data,TResult Function( EmptyFailure value)?  empty,TResult Function( LocalFailure value)?  local,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerFailure() when server != null:
return server(_that);case NetworkFailure() when network != null:
return network(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case DataFailure() when data != null:
return data(_that);case EmptyFailure() when empty != null:
return empty(_that);case LocalFailure() when local != null:
return local(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerFailure value)  server,required TResult Function( NetworkFailure value)  network,required TResult Function( UnexpectedFailure value)  unexpected,required TResult Function( DataFailure value)  data,required TResult Function( EmptyFailure value)  empty,required TResult Function( LocalFailure value)  local,}){
final _that = this;
switch (_that) {
case ServerFailure():
return server(_that);case NetworkFailure():
return network(_that);case UnexpectedFailure():
return unexpected(_that);case DataFailure():
return data(_that);case EmptyFailure():
return empty(_that);case LocalFailure():
return local(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerFailure value)?  server,TResult? Function( NetworkFailure value)?  network,TResult? Function( UnexpectedFailure value)?  unexpected,TResult? Function( DataFailure value)?  data,TResult? Function( EmptyFailure value)?  empty,TResult? Function( LocalFailure value)?  local,}){
final _that = this;
switch (_that) {
case ServerFailure() when server != null:
return server(_that);case NetworkFailure() when network != null:
return network(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case DataFailure() when data != null:
return data(_that);case EmptyFailure() when empty != null:
return empty(_that);case LocalFailure() when local != null:
return local(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  Icon? icon)?  server,TResult Function( String message,  Icon? icon)?  network,TResult Function( String message,  Icon? icon)?  unexpected,TResult Function( String message,  Icon? icon)?  data,TResult Function( String message,  Icon? icon)?  empty,TResult Function( String message,  Icon? icon)?  local,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerFailure() when server != null:
return server(_that.message,_that.icon);case NetworkFailure() when network != null:
return network(_that.message,_that.icon);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.message,_that.icon);case DataFailure() when data != null:
return data(_that.message,_that.icon);case EmptyFailure() when empty != null:
return empty(_that.message,_that.icon);case LocalFailure() when local != null:
return local(_that.message,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  Icon? icon)  server,required TResult Function( String message,  Icon? icon)  network,required TResult Function( String message,  Icon? icon)  unexpected,required TResult Function( String message,  Icon? icon)  data,required TResult Function( String message,  Icon? icon)  empty,required TResult Function( String message,  Icon? icon)  local,}) {final _that = this;
switch (_that) {
case ServerFailure():
return server(_that.message,_that.icon);case NetworkFailure():
return network(_that.message,_that.icon);case UnexpectedFailure():
return unexpected(_that.message,_that.icon);case DataFailure():
return data(_that.message,_that.icon);case EmptyFailure():
return empty(_that.message,_that.icon);case LocalFailure():
return local(_that.message,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  Icon? icon)?  server,TResult? Function( String message,  Icon? icon)?  network,TResult? Function( String message,  Icon? icon)?  unexpected,TResult? Function( String message,  Icon? icon)?  data,TResult? Function( String message,  Icon? icon)?  empty,TResult? Function( String message,  Icon? icon)?  local,}) {final _that = this;
switch (_that) {
case ServerFailure() when server != null:
return server(_that.message,_that.icon);case NetworkFailure() when network != null:
return network(_that.message,_that.icon);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.message,_that.icon);case DataFailure() when data != null:
return data(_that.message,_that.icon);case EmptyFailure() when empty != null:
return empty(_that.message,_that.icon);case LocalFailure() when local != null:
return local(_that.message,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class ServerFailure implements Failure {
  const ServerFailure({required this.message, this.icon = const Icon(Icons.cloud_off_rounded, color: Colors.orangeAccent)});
  

@override final  String message;
@override@JsonKey() final  Icon? icon;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,message,icon);

@override
String toString() {
  return 'Failure.server(message: $message, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Icon? icon
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? icon = freezed,}) {
  return _then(ServerFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,
  ));
}


}

/// @nodoc


class NetworkFailure implements Failure {
  const NetworkFailure({this.message = 'No internet connection. Please check your network settings.', this.icon = const Icon(Icons.wifi_off_rounded, color: Colors.blueAccent)});
  

@override@JsonKey() final  String message;
@override@JsonKey() final  Icon? icon;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkFailureCopyWith<NetworkFailure> get copyWith => _$NetworkFailureCopyWithImpl<NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,message,icon);

@override
String toString() {
  return 'Failure.network(message: $message, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $NetworkFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(NetworkFailure value, $Res Function(NetworkFailure) _then) = _$NetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Icon? icon
});




}
/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._self, this._then);

  final NetworkFailure _self;
  final $Res Function(NetworkFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? icon = freezed,}) {
  return _then(NetworkFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,
  ));
}


}

/// @nodoc


class UnexpectedFailure implements Failure {
  const UnexpectedFailure({this.message = 'Something went wrong. Please try again.', this.icon = const Icon(Icons.error_outline, color: Colors.redAccent)});
  

@override@JsonKey() final  String message;
@override@JsonKey() final  Icon? icon;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedFailureCopyWith<UnexpectedFailure> get copyWith => _$UnexpectedFailureCopyWithImpl<UnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,message,icon);

@override
String toString() {
  return 'Failure.unexpected(message: $message, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $UnexpectedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnexpectedFailureCopyWith(UnexpectedFailure value, $Res Function(UnexpectedFailure) _then) = _$UnexpectedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Icon? icon
});




}
/// @nodoc
class _$UnexpectedFailureCopyWithImpl<$Res>
    implements $UnexpectedFailureCopyWith<$Res> {
  _$UnexpectedFailureCopyWithImpl(this._self, this._then);

  final UnexpectedFailure _self;
  final $Res Function(UnexpectedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? icon = freezed,}) {
  return _then(UnexpectedFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,
  ));
}


}

/// @nodoc


class DataFailure implements Failure {
  const DataFailure({this.message = 'There was an error reading data. Please try again later.', this.icon = const Icon(Icons.dataset_linked_rounded, color: Colors.deepPurple)});
  

@override@JsonKey() final  String message;
@override@JsonKey() final  Icon? icon;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataFailureCopyWith<DataFailure> get copyWith => _$DataFailureCopyWithImpl<DataFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,message,icon);

@override
String toString() {
  return 'Failure.data(message: $message, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $DataFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $DataFailureCopyWith(DataFailure value, $Res Function(DataFailure) _then) = _$DataFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Icon? icon
});




}
/// @nodoc
class _$DataFailureCopyWithImpl<$Res>
    implements $DataFailureCopyWith<$Res> {
  _$DataFailureCopyWithImpl(this._self, this._then);

  final DataFailure _self;
  final $Res Function(DataFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? icon = freezed,}) {
  return _then(DataFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,
  ));
}


}

/// @nodoc


class EmptyFailure implements Failure {
  const EmptyFailure({this.message = 'No data available right now.', this.icon = const Icon(Icons.inbox_rounded, color: Colors.grey)});
  

@override@JsonKey() final  String message;
@override@JsonKey() final  Icon? icon;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmptyFailureCopyWith<EmptyFailure> get copyWith => _$EmptyFailureCopyWithImpl<EmptyFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,message,icon);

@override
String toString() {
  return 'Failure.empty(message: $message, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $EmptyFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $EmptyFailureCopyWith(EmptyFailure value, $Res Function(EmptyFailure) _then) = _$EmptyFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Icon? icon
});




}
/// @nodoc
class _$EmptyFailureCopyWithImpl<$Res>
    implements $EmptyFailureCopyWith<$Res> {
  _$EmptyFailureCopyWithImpl(this._self, this._then);

  final EmptyFailure _self;
  final $Res Function(EmptyFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? icon = freezed,}) {
  return _then(EmptyFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,
  ));
}


}

/// @nodoc


class LocalFailure implements Failure {
  const LocalFailure({this.message = 'A local storage error occurred.', this.icon = const Icon(Icons.save_alt_rounded, color: Colors.teal)});
  

@override@JsonKey() final  String message;
@override@JsonKey() final  Icon? icon;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalFailureCopyWith<LocalFailure> get copyWith => _$LocalFailureCopyWithImpl<LocalFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,message,icon);

@override
String toString() {
  return 'Failure.local(message: $message, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $LocalFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $LocalFailureCopyWith(LocalFailure value, $Res Function(LocalFailure) _then) = _$LocalFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Icon? icon
});




}
/// @nodoc
class _$LocalFailureCopyWithImpl<$Res>
    implements $LocalFailureCopyWith<$Res> {
  _$LocalFailureCopyWithImpl(this._self, this._then);

  final LocalFailure _self;
  final $Res Function(LocalFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? icon = freezed,}) {
  return _then(LocalFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon?,
  ));
}


}

// dart format on
