// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidUserName<T> invalidUserName<T>({required String failedValue}) {
    return InvalidUserName<T>(
      failedValue: failedValue,
    );
  }

  InvalidPassword<T> invalidPassword<T>({required String failedValue}) {
    return InvalidPassword<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  String get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidUserName,
    required TResult Function(String failedValue) invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidUserName,
    TResult Function(String failedValue)? invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidUserName,
    TResult Function(String failedValue)? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidUserName<T> value) invalidUserName,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $InvalidUserNameCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidUserNameCopyWith(
          InvalidUserName<T> value, $Res Function(InvalidUserName<T>) then) =
      _$InvalidUserNameCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidUserNameCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidUserNameCopyWith<T, $Res> {
  _$InvalidUserNameCopyWithImpl(
      InvalidUserName<T> _value, $Res Function(InvalidUserName<T>) _then)
      : super(_value, (v) => _then(v as InvalidUserName<T>));

  @override
  InvalidUserName<T> get _value => super._value as InvalidUserName<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(InvalidUserName<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidUserName<T> implements InvalidUserName<T> {
  const _$InvalidUserName({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidUserName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidUserName<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $InvalidUserNameCopyWith<T, InvalidUserName<T>> get copyWith =>
      _$InvalidUserNameCopyWithImpl<T, InvalidUserName<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidUserName,
    required TResult Function(String failedValue) invalidPassword,
  }) {
    return invalidUserName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidUserName,
    TResult Function(String failedValue)? invalidPassword,
  }) {
    return invalidUserName?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidUserName,
    TResult Function(String failedValue)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidUserName != null) {
      return invalidUserName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidUserName<T> value) invalidUserName,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
  }) {
    return invalidUserName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
  }) {
    return invalidUserName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidUserName != null) {
      return invalidUserName(this);
    }
    return orElse();
  }
}

abstract class InvalidUserName<T> implements ValueFailure<T> {
  const factory InvalidUserName({required String failedValue}) =
      _$InvalidUserName<T>;

  @override
  String get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InvalidUserNameCopyWith<T, InvalidUserName<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidPasswordCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidPasswordCopyWith(
          InvalidPassword<T> value, $Res Function(InvalidPassword<T>) then) =
      _$InvalidPasswordCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidPasswordCopyWith<T, $Res> {
  _$InvalidPasswordCopyWithImpl(
      InvalidPassword<T> _value, $Res Function(InvalidPassword<T>) _then)
      : super(_value, (v) => _then(v as InvalidPassword<T>));

  @override
  InvalidPassword<T> get _value => super._value as InvalidPassword<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(InvalidPassword<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidPassword<T> implements InvalidPassword<T> {
  const _$InvalidPassword({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidPassword<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $InvalidPasswordCopyWith<T, InvalidPassword<T>> get copyWith =>
      _$InvalidPasswordCopyWithImpl<T, InvalidPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidUserName,
    required TResult Function(String failedValue) invalidPassword,
  }) {
    return invalidPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidUserName,
    TResult Function(String failedValue)? invalidPassword,
  }) {
    return invalidPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidUserName,
    TResult Function(String failedValue)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidUserName<T> value) invalidUserName,
    required TResult Function(InvalidPassword<T> value) invalidPassword,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
  }) {
    return invalidPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    TResult Function(InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidPassword<T> implements ValueFailure<T> {
  const factory InvalidPassword({required String failedValue}) =
      _$InvalidPassword<T>;

  @override
  String get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InvalidPasswordCopyWith<T, InvalidPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FailureTearOff {
  const _$FailureTearOff();

  _APIFailure<T> apiFailure<T>(ApiFailure apiFailure) {
    return _APIFailure<T>(
      apiFailure,
    );
  }

  _DBFailure<T> dbFailure<T>(DBFailure dbFailure) {
    return _DBFailure<T>(
      dbFailure,
    );
  }
}

/// @nodoc
const $Failure = _$FailureTearOff();

/// @nodoc
mixin _$Failure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiFailure apiFailure) apiFailure,
    required TResult Function(DBFailure dbFailure) dbFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiFailure apiFailure)? apiFailure,
    TResult Function(DBFailure dbFailure)? dbFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiFailure apiFailure)? apiFailure,
    TResult Function(DBFailure dbFailure)? dbFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_APIFailure<T> value) apiFailure,
    required TResult Function(_DBFailure<T> value) dbFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_APIFailure<T> value)? apiFailure,
    TResult Function(_DBFailure<T> value)? dbFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_APIFailure<T> value)? apiFailure,
    TResult Function(_DBFailure<T> value)? dbFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res> implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure<T> _value;
  // ignore: unused_field
  final $Res Function(Failure<T>) _then;
}

/// @nodoc
abstract class _$APIFailureCopyWith<T, $Res> {
  factory _$APIFailureCopyWith(
          _APIFailure<T> value, $Res Function(_APIFailure<T>) then) =
      __$APIFailureCopyWithImpl<T, $Res>;
  $Res call({ApiFailure apiFailure});

  $ApiFailureCopyWith<$Res> get apiFailure;
}

/// @nodoc
class __$APIFailureCopyWithImpl<T, $Res> extends _$FailureCopyWithImpl<T, $Res>
    implements _$APIFailureCopyWith<T, $Res> {
  __$APIFailureCopyWithImpl(
      _APIFailure<T> _value, $Res Function(_APIFailure<T>) _then)
      : super(_value, (v) => _then(v as _APIFailure<T>));

  @override
  _APIFailure<T> get _value => super._value as _APIFailure<T>;

  @override
  $Res call({
    Object? apiFailure = freezed,
  }) {
    return _then(_APIFailure<T>(
      apiFailure == freezed
          ? _value.apiFailure
          : apiFailure // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }

  @override
  $ApiFailureCopyWith<$Res> get apiFailure {
    return $ApiFailureCopyWith<$Res>(_value.apiFailure, (value) {
      return _then(_value.copyWith(apiFailure: value));
    });
  }
}

/// @nodoc

class _$_APIFailure<T> implements _APIFailure<T> {
  const _$_APIFailure(this.apiFailure);

  @override
  final ApiFailure apiFailure;

  @override
  String toString() {
    return 'Failure<$T>.apiFailure(apiFailure: $apiFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _APIFailure<T> &&
            (identical(other.apiFailure, apiFailure) ||
                const DeepCollectionEquality()
                    .equals(other.apiFailure, apiFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(apiFailure);

  @JsonKey(ignore: true)
  @override
  _$APIFailureCopyWith<T, _APIFailure<T>> get copyWith =>
      __$APIFailureCopyWithImpl<T, _APIFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiFailure apiFailure) apiFailure,
    required TResult Function(DBFailure dbFailure) dbFailure,
  }) {
    return apiFailure(this.apiFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiFailure apiFailure)? apiFailure,
    TResult Function(DBFailure dbFailure)? dbFailure,
  }) {
    return apiFailure?.call(this.apiFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiFailure apiFailure)? apiFailure,
    TResult Function(DBFailure dbFailure)? dbFailure,
    required TResult orElse(),
  }) {
    if (apiFailure != null) {
      return apiFailure(this.apiFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_APIFailure<T> value) apiFailure,
    required TResult Function(_DBFailure<T> value) dbFailure,
  }) {
    return apiFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_APIFailure<T> value)? apiFailure,
    TResult Function(_DBFailure<T> value)? dbFailure,
  }) {
    return apiFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_APIFailure<T> value)? apiFailure,
    TResult Function(_DBFailure<T> value)? dbFailure,
    required TResult orElse(),
  }) {
    if (apiFailure != null) {
      return apiFailure(this);
    }
    return orElse();
  }
}

abstract class _APIFailure<T> implements Failure<T> {
  const factory _APIFailure(ApiFailure apiFailure) = _$_APIFailure<T>;

  ApiFailure get apiFailure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$APIFailureCopyWith<T, _APIFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DBFailureCopyWith<T, $Res> {
  factory _$DBFailureCopyWith(
          _DBFailure<T> value, $Res Function(_DBFailure<T>) then) =
      __$DBFailureCopyWithImpl<T, $Res>;
  $Res call({DBFailure dbFailure});

  $DBFailureCopyWith<$Res> get dbFailure;
}

/// @nodoc
class __$DBFailureCopyWithImpl<T, $Res> extends _$FailureCopyWithImpl<T, $Res>
    implements _$DBFailureCopyWith<T, $Res> {
  __$DBFailureCopyWithImpl(
      _DBFailure<T> _value, $Res Function(_DBFailure<T>) _then)
      : super(_value, (v) => _then(v as _DBFailure<T>));

  @override
  _DBFailure<T> get _value => super._value as _DBFailure<T>;

  @override
  $Res call({
    Object? dbFailure = freezed,
  }) {
    return _then(_DBFailure<T>(
      dbFailure == freezed
          ? _value.dbFailure
          : dbFailure // ignore: cast_nullable_to_non_nullable
              as DBFailure,
    ));
  }

  @override
  $DBFailureCopyWith<$Res> get dbFailure {
    return $DBFailureCopyWith<$Res>(_value.dbFailure, (value) {
      return _then(_value.copyWith(dbFailure: value));
    });
  }
}

/// @nodoc

class _$_DBFailure<T> implements _DBFailure<T> {
  const _$_DBFailure(this.dbFailure);

  @override
  final DBFailure dbFailure;

  @override
  String toString() {
    return 'Failure<$T>.dbFailure(dbFailure: $dbFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DBFailure<T> &&
            (identical(other.dbFailure, dbFailure) ||
                const DeepCollectionEquality()
                    .equals(other.dbFailure, dbFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dbFailure);

  @JsonKey(ignore: true)
  @override
  _$DBFailureCopyWith<T, _DBFailure<T>> get copyWith =>
      __$DBFailureCopyWithImpl<T, _DBFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ApiFailure apiFailure) apiFailure,
    required TResult Function(DBFailure dbFailure) dbFailure,
  }) {
    return dbFailure(this.dbFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ApiFailure apiFailure)? apiFailure,
    TResult Function(DBFailure dbFailure)? dbFailure,
  }) {
    return dbFailure?.call(this.dbFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ApiFailure apiFailure)? apiFailure,
    TResult Function(DBFailure dbFailure)? dbFailure,
    required TResult orElse(),
  }) {
    if (dbFailure != null) {
      return dbFailure(this.dbFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_APIFailure<T> value) apiFailure,
    required TResult Function(_DBFailure<T> value) dbFailure,
  }) {
    return dbFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_APIFailure<T> value)? apiFailure,
    TResult Function(_DBFailure<T> value)? dbFailure,
  }) {
    return dbFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_APIFailure<T> value)? apiFailure,
    TResult Function(_DBFailure<T> value)? dbFailure,
    required TResult orElse(),
  }) {
    if (dbFailure != null) {
      return dbFailure(this);
    }
    return orElse();
  }
}

abstract class _DBFailure<T> implements Failure<T> {
  const factory _DBFailure(DBFailure dbFailure) = _$_DBFailure<T>;

  DBFailure get dbFailure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$DBFailureCopyWith<T, _DBFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
