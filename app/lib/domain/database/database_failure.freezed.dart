// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'database_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DBFailureTearOff {
  const _$DBFailureTearOff();

  UnknownError unknownError() {
    return const UnknownError();
  }

  DataNotExists dataNotExists() {
    return const DataNotExists();
  }
}

/// @nodoc
const $DBFailure = _$DBFailureTearOff();

/// @nodoc
mixin _$DBFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknownError,
    required TResult Function() dataNotExists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknownError,
    TResult Function()? dataNotExists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknownError,
    TResult Function()? dataNotExists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(DataNotExists value) dataNotExists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(DataNotExists value)? dataNotExists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(DataNotExists value)? dataNotExists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBFailureCopyWith<$Res> {
  factory $DBFailureCopyWith(DBFailure value, $Res Function(DBFailure) then) =
      _$DBFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$DBFailureCopyWithImpl<$Res> implements $DBFailureCopyWith<$Res> {
  _$DBFailureCopyWithImpl(this._value, this._then);

  final DBFailure _value;
  // ignore: unused_field
  final $Res Function(DBFailure) _then;
}

/// @nodoc
abstract class $UnknownErrorCopyWith<$Res> {
  factory $UnknownErrorCopyWith(
          UnknownError value, $Res Function(UnknownError) then) =
      _$UnknownErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnknownErrorCopyWithImpl<$Res> extends _$DBFailureCopyWithImpl<$Res>
    implements $UnknownErrorCopyWith<$Res> {
  _$UnknownErrorCopyWithImpl(
      UnknownError _value, $Res Function(UnknownError) _then)
      : super(_value, (v) => _then(v as UnknownError));

  @override
  UnknownError get _value => super._value as UnknownError;
}

/// @nodoc

class _$UnknownError implements UnknownError {
  const _$UnknownError();

  @override
  String toString() {
    return 'DBFailure.unknownError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnknownError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknownError,
    required TResult Function() dataNotExists,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknownError,
    TResult Function()? dataNotExists,
  }) {
    return unknownError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknownError,
    TResult Function()? dataNotExists,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(DataNotExists value) dataNotExists,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(DataNotExists value)? dataNotExists,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(DataNotExists value)? dataNotExists,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class UnknownError implements DBFailure {
  const factory UnknownError() = _$UnknownError;
}

/// @nodoc
abstract class $DataNotExistsCopyWith<$Res> {
  factory $DataNotExistsCopyWith(
          DataNotExists value, $Res Function(DataNotExists) then) =
      _$DataNotExistsCopyWithImpl<$Res>;
}

/// @nodoc
class _$DataNotExistsCopyWithImpl<$Res> extends _$DBFailureCopyWithImpl<$Res>
    implements $DataNotExistsCopyWith<$Res> {
  _$DataNotExistsCopyWithImpl(
      DataNotExists _value, $Res Function(DataNotExists) _then)
      : super(_value, (v) => _then(v as DataNotExists));

  @override
  DataNotExists get _value => super._value as DataNotExists;
}

/// @nodoc

class _$DataNotExists implements DataNotExists {
  const _$DataNotExists();

  @override
  String toString() {
    return 'DBFailure.dataNotExists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DataNotExists);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknownError,
    required TResult Function() dataNotExists,
  }) {
    return dataNotExists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unknownError,
    TResult Function()? dataNotExists,
  }) {
    return dataNotExists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknownError,
    TResult Function()? dataNotExists,
    required TResult orElse(),
  }) {
    if (dataNotExists != null) {
      return dataNotExists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(DataNotExists value) dataNotExists,
  }) {
    return dataNotExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(DataNotExists value)? dataNotExists,
  }) {
    return dataNotExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(DataNotExists value)? dataNotExists,
    required TResult orElse(),
  }) {
    if (dataNotExists != null) {
      return dataNotExists(this);
    }
    return orElse();
  }
}

abstract class DataNotExists implements DBFailure {
  const factory DataNotExists() = _$DataNotExists;
}
