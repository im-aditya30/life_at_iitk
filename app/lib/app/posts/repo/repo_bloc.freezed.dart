// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RepoEventTearOff {
  const _$RepoEventTearOff();

  _UpdateStudentData updateStudentData(
      {required String queryColumn,
      required String queryData,
      required String rollno}) {
    return _UpdateStudentData(
      queryColumn: queryColumn,
      queryData: queryData,
      rollno: rollno,
    );
  }

  _LoadAppData loadAppData() {
    return const _LoadAppData();
  }

  _LoadUserData loadUserData() {
    return const _LoadUserData();
  }

  _LoadPeopleData loadPeopleData() {
    return const _LoadPeopleData();
  }

  _LoadCouncilData loadCouncilData() {
    return const _LoadCouncilData();
  }

  _GetAllStudentData getAllStudentData() {
    return const _GetAllStudentData();
  }

  _GetUserStudentData getUserStudentData() {
    return const _GetUserStudentData();
  }
}

/// @nodoc
const $RepoEvent = _$RepoEventTearOff();

/// @nodoc
mixin _$RepoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String queryColumn, String queryData, String rollno)
        updateStudentData,
    required TResult Function() loadAppData,
    required TResult Function() loadUserData,
    required TResult Function() loadPeopleData,
    required TResult Function() loadCouncilData,
    required TResult Function() getAllStudentData,
    required TResult Function() getUserStudentData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateStudentData value) updateStudentData,
    required TResult Function(_LoadAppData value) loadAppData,
    required TResult Function(_LoadUserData value) loadUserData,
    required TResult Function(_LoadPeopleData value) loadPeopleData,
    required TResult Function(_LoadCouncilData value) loadCouncilData,
    required TResult Function(_GetAllStudentData value) getAllStudentData,
    required TResult Function(_GetUserStudentData value) getUserStudentData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoEventCopyWith<$Res> {
  factory $RepoEventCopyWith(RepoEvent value, $Res Function(RepoEvent) then) =
      _$RepoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RepoEventCopyWithImpl<$Res> implements $RepoEventCopyWith<$Res> {
  _$RepoEventCopyWithImpl(this._value, this._then);

  final RepoEvent _value;
  // ignore: unused_field
  final $Res Function(RepoEvent) _then;
}

/// @nodoc
abstract class _$UpdateStudentDataCopyWith<$Res> {
  factory _$UpdateStudentDataCopyWith(
          _UpdateStudentData value, $Res Function(_UpdateStudentData) then) =
      __$UpdateStudentDataCopyWithImpl<$Res>;
  $Res call({String queryColumn, String queryData, String rollno});
}

/// @nodoc
class __$UpdateStudentDataCopyWithImpl<$Res>
    extends _$RepoEventCopyWithImpl<$Res>
    implements _$UpdateStudentDataCopyWith<$Res> {
  __$UpdateStudentDataCopyWithImpl(
      _UpdateStudentData _value, $Res Function(_UpdateStudentData) _then)
      : super(_value, (v) => _then(v as _UpdateStudentData));

  @override
  _UpdateStudentData get _value => super._value as _UpdateStudentData;

  @override
  $Res call({
    Object? queryColumn = freezed,
    Object? queryData = freezed,
    Object? rollno = freezed,
  }) {
    return _then(_UpdateStudentData(
      queryColumn: queryColumn == freezed
          ? _value.queryColumn
          : queryColumn // ignore: cast_nullable_to_non_nullable
              as String,
      queryData: queryData == freezed
          ? _value.queryData
          : queryData // ignore: cast_nullable_to_non_nullable
              as String,
      rollno: rollno == freezed
          ? _value.rollno
          : rollno // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateStudentData implements _UpdateStudentData {
  const _$_UpdateStudentData(
      {required this.queryColumn,
      required this.queryData,
      required this.rollno});

  @override
  final String queryColumn;
  @override
  final String queryData;
  @override
  final String rollno;

  @override
  String toString() {
    return 'RepoEvent.updateStudentData(queryColumn: $queryColumn, queryData: $queryData, rollno: $rollno)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateStudentData &&
            (identical(other.queryColumn, queryColumn) ||
                const DeepCollectionEquality()
                    .equals(other.queryColumn, queryColumn)) &&
            (identical(other.queryData, queryData) ||
                const DeepCollectionEquality()
                    .equals(other.queryData, queryData)) &&
            (identical(other.rollno, rollno) ||
                const DeepCollectionEquality().equals(other.rollno, rollno)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(queryColumn) ^
      const DeepCollectionEquality().hash(queryData) ^
      const DeepCollectionEquality().hash(rollno);

  @JsonKey(ignore: true)
  @override
  _$UpdateStudentDataCopyWith<_UpdateStudentData> get copyWith =>
      __$UpdateStudentDataCopyWithImpl<_UpdateStudentData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String queryColumn, String queryData, String rollno)
        updateStudentData,
    required TResult Function() loadAppData,
    required TResult Function() loadUserData,
    required TResult Function() loadPeopleData,
    required TResult Function() loadCouncilData,
    required TResult Function() getAllStudentData,
    required TResult Function() getUserStudentData,
  }) {
    return updateStudentData(queryColumn, queryData, rollno);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
  }) {
    return updateStudentData?.call(queryColumn, queryData, rollno);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
    required TResult orElse(),
  }) {
    if (updateStudentData != null) {
      return updateStudentData(queryColumn, queryData, rollno);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateStudentData value) updateStudentData,
    required TResult Function(_LoadAppData value) loadAppData,
    required TResult Function(_LoadUserData value) loadUserData,
    required TResult Function(_LoadPeopleData value) loadPeopleData,
    required TResult Function(_LoadCouncilData value) loadCouncilData,
    required TResult Function(_GetAllStudentData value) getAllStudentData,
    required TResult Function(_GetUserStudentData value) getUserStudentData,
  }) {
    return updateStudentData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
  }) {
    return updateStudentData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
    required TResult orElse(),
  }) {
    if (updateStudentData != null) {
      return updateStudentData(this);
    }
    return orElse();
  }
}

abstract class _UpdateStudentData implements RepoEvent {
  const factory _UpdateStudentData(
      {required String queryColumn,
      required String queryData,
      required String rollno}) = _$_UpdateStudentData;

  String get queryColumn => throw _privateConstructorUsedError;
  String get queryData => throw _privateConstructorUsedError;
  String get rollno => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UpdateStudentDataCopyWith<_UpdateStudentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadAppDataCopyWith<$Res> {
  factory _$LoadAppDataCopyWith(
          _LoadAppData value, $Res Function(_LoadAppData) then) =
      __$LoadAppDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadAppDataCopyWithImpl<$Res> extends _$RepoEventCopyWithImpl<$Res>
    implements _$LoadAppDataCopyWith<$Res> {
  __$LoadAppDataCopyWithImpl(
      _LoadAppData _value, $Res Function(_LoadAppData) _then)
      : super(_value, (v) => _then(v as _LoadAppData));

  @override
  _LoadAppData get _value => super._value as _LoadAppData;
}

/// @nodoc

class _$_LoadAppData implements _LoadAppData {
  const _$_LoadAppData();

  @override
  String toString() {
    return 'RepoEvent.loadAppData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadAppData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String queryColumn, String queryData, String rollno)
        updateStudentData,
    required TResult Function() loadAppData,
    required TResult Function() loadUserData,
    required TResult Function() loadPeopleData,
    required TResult Function() loadCouncilData,
    required TResult Function() getAllStudentData,
    required TResult Function() getUserStudentData,
  }) {
    return loadAppData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
  }) {
    return loadAppData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
    required TResult orElse(),
  }) {
    if (loadAppData != null) {
      return loadAppData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateStudentData value) updateStudentData,
    required TResult Function(_LoadAppData value) loadAppData,
    required TResult Function(_LoadUserData value) loadUserData,
    required TResult Function(_LoadPeopleData value) loadPeopleData,
    required TResult Function(_LoadCouncilData value) loadCouncilData,
    required TResult Function(_GetAllStudentData value) getAllStudentData,
    required TResult Function(_GetUserStudentData value) getUserStudentData,
  }) {
    return loadAppData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
  }) {
    return loadAppData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
    required TResult orElse(),
  }) {
    if (loadAppData != null) {
      return loadAppData(this);
    }
    return orElse();
  }
}

abstract class _LoadAppData implements RepoEvent {
  const factory _LoadAppData() = _$_LoadAppData;
}

/// @nodoc
abstract class _$LoadUserDataCopyWith<$Res> {
  factory _$LoadUserDataCopyWith(
          _LoadUserData value, $Res Function(_LoadUserData) then) =
      __$LoadUserDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadUserDataCopyWithImpl<$Res> extends _$RepoEventCopyWithImpl<$Res>
    implements _$LoadUserDataCopyWith<$Res> {
  __$LoadUserDataCopyWithImpl(
      _LoadUserData _value, $Res Function(_LoadUserData) _then)
      : super(_value, (v) => _then(v as _LoadUserData));

  @override
  _LoadUserData get _value => super._value as _LoadUserData;
}

/// @nodoc

class _$_LoadUserData implements _LoadUserData {
  const _$_LoadUserData();

  @override
  String toString() {
    return 'RepoEvent.loadUserData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadUserData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String queryColumn, String queryData, String rollno)
        updateStudentData,
    required TResult Function() loadAppData,
    required TResult Function() loadUserData,
    required TResult Function() loadPeopleData,
    required TResult Function() loadCouncilData,
    required TResult Function() getAllStudentData,
    required TResult Function() getUserStudentData,
  }) {
    return loadUserData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
  }) {
    return loadUserData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
    required TResult orElse(),
  }) {
    if (loadUserData != null) {
      return loadUserData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateStudentData value) updateStudentData,
    required TResult Function(_LoadAppData value) loadAppData,
    required TResult Function(_LoadUserData value) loadUserData,
    required TResult Function(_LoadPeopleData value) loadPeopleData,
    required TResult Function(_LoadCouncilData value) loadCouncilData,
    required TResult Function(_GetAllStudentData value) getAllStudentData,
    required TResult Function(_GetUserStudentData value) getUserStudentData,
  }) {
    return loadUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
  }) {
    return loadUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
    required TResult orElse(),
  }) {
    if (loadUserData != null) {
      return loadUserData(this);
    }
    return orElse();
  }
}

abstract class _LoadUserData implements RepoEvent {
  const factory _LoadUserData() = _$_LoadUserData;
}

/// @nodoc
abstract class _$LoadPeopleDataCopyWith<$Res> {
  factory _$LoadPeopleDataCopyWith(
          _LoadPeopleData value, $Res Function(_LoadPeopleData) then) =
      __$LoadPeopleDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadPeopleDataCopyWithImpl<$Res> extends _$RepoEventCopyWithImpl<$Res>
    implements _$LoadPeopleDataCopyWith<$Res> {
  __$LoadPeopleDataCopyWithImpl(
      _LoadPeopleData _value, $Res Function(_LoadPeopleData) _then)
      : super(_value, (v) => _then(v as _LoadPeopleData));

  @override
  _LoadPeopleData get _value => super._value as _LoadPeopleData;
}

/// @nodoc

class _$_LoadPeopleData implements _LoadPeopleData {
  const _$_LoadPeopleData();

  @override
  String toString() {
    return 'RepoEvent.loadPeopleData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadPeopleData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String queryColumn, String queryData, String rollno)
        updateStudentData,
    required TResult Function() loadAppData,
    required TResult Function() loadUserData,
    required TResult Function() loadPeopleData,
    required TResult Function() loadCouncilData,
    required TResult Function() getAllStudentData,
    required TResult Function() getUserStudentData,
  }) {
    return loadPeopleData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
  }) {
    return loadPeopleData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
    required TResult orElse(),
  }) {
    if (loadPeopleData != null) {
      return loadPeopleData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateStudentData value) updateStudentData,
    required TResult Function(_LoadAppData value) loadAppData,
    required TResult Function(_LoadUserData value) loadUserData,
    required TResult Function(_LoadPeopleData value) loadPeopleData,
    required TResult Function(_LoadCouncilData value) loadCouncilData,
    required TResult Function(_GetAllStudentData value) getAllStudentData,
    required TResult Function(_GetUserStudentData value) getUserStudentData,
  }) {
    return loadPeopleData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
  }) {
    return loadPeopleData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
    required TResult orElse(),
  }) {
    if (loadPeopleData != null) {
      return loadPeopleData(this);
    }
    return orElse();
  }
}

abstract class _LoadPeopleData implements RepoEvent {
  const factory _LoadPeopleData() = _$_LoadPeopleData;
}

/// @nodoc
abstract class _$LoadCouncilDataCopyWith<$Res> {
  factory _$LoadCouncilDataCopyWith(
          _LoadCouncilData value, $Res Function(_LoadCouncilData) then) =
      __$LoadCouncilDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadCouncilDataCopyWithImpl<$Res> extends _$RepoEventCopyWithImpl<$Res>
    implements _$LoadCouncilDataCopyWith<$Res> {
  __$LoadCouncilDataCopyWithImpl(
      _LoadCouncilData _value, $Res Function(_LoadCouncilData) _then)
      : super(_value, (v) => _then(v as _LoadCouncilData));

  @override
  _LoadCouncilData get _value => super._value as _LoadCouncilData;
}

/// @nodoc

class _$_LoadCouncilData implements _LoadCouncilData {
  const _$_LoadCouncilData();

  @override
  String toString() {
    return 'RepoEvent.loadCouncilData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadCouncilData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String queryColumn, String queryData, String rollno)
        updateStudentData,
    required TResult Function() loadAppData,
    required TResult Function() loadUserData,
    required TResult Function() loadPeopleData,
    required TResult Function() loadCouncilData,
    required TResult Function() getAllStudentData,
    required TResult Function() getUserStudentData,
  }) {
    return loadCouncilData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
  }) {
    return loadCouncilData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
    required TResult orElse(),
  }) {
    if (loadCouncilData != null) {
      return loadCouncilData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateStudentData value) updateStudentData,
    required TResult Function(_LoadAppData value) loadAppData,
    required TResult Function(_LoadUserData value) loadUserData,
    required TResult Function(_LoadPeopleData value) loadPeopleData,
    required TResult Function(_LoadCouncilData value) loadCouncilData,
    required TResult Function(_GetAllStudentData value) getAllStudentData,
    required TResult Function(_GetUserStudentData value) getUserStudentData,
  }) {
    return loadCouncilData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
  }) {
    return loadCouncilData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
    required TResult orElse(),
  }) {
    if (loadCouncilData != null) {
      return loadCouncilData(this);
    }
    return orElse();
  }
}

abstract class _LoadCouncilData implements RepoEvent {
  const factory _LoadCouncilData() = _$_LoadCouncilData;
}

/// @nodoc
abstract class _$GetAllStudentDataCopyWith<$Res> {
  factory _$GetAllStudentDataCopyWith(
          _GetAllStudentData value, $Res Function(_GetAllStudentData) then) =
      __$GetAllStudentDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetAllStudentDataCopyWithImpl<$Res>
    extends _$RepoEventCopyWithImpl<$Res>
    implements _$GetAllStudentDataCopyWith<$Res> {
  __$GetAllStudentDataCopyWithImpl(
      _GetAllStudentData _value, $Res Function(_GetAllStudentData) _then)
      : super(_value, (v) => _then(v as _GetAllStudentData));

  @override
  _GetAllStudentData get _value => super._value as _GetAllStudentData;
}

/// @nodoc

class _$_GetAllStudentData implements _GetAllStudentData {
  const _$_GetAllStudentData();

  @override
  String toString() {
    return 'RepoEvent.getAllStudentData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetAllStudentData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String queryColumn, String queryData, String rollno)
        updateStudentData,
    required TResult Function() loadAppData,
    required TResult Function() loadUserData,
    required TResult Function() loadPeopleData,
    required TResult Function() loadCouncilData,
    required TResult Function() getAllStudentData,
    required TResult Function() getUserStudentData,
  }) {
    return getAllStudentData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
  }) {
    return getAllStudentData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
    required TResult orElse(),
  }) {
    if (getAllStudentData != null) {
      return getAllStudentData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateStudentData value) updateStudentData,
    required TResult Function(_LoadAppData value) loadAppData,
    required TResult Function(_LoadUserData value) loadUserData,
    required TResult Function(_LoadPeopleData value) loadPeopleData,
    required TResult Function(_LoadCouncilData value) loadCouncilData,
    required TResult Function(_GetAllStudentData value) getAllStudentData,
    required TResult Function(_GetUserStudentData value) getUserStudentData,
  }) {
    return getAllStudentData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
  }) {
    return getAllStudentData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
    required TResult orElse(),
  }) {
    if (getAllStudentData != null) {
      return getAllStudentData(this);
    }
    return orElse();
  }
}

abstract class _GetAllStudentData implements RepoEvent {
  const factory _GetAllStudentData() = _$_GetAllStudentData;
}

/// @nodoc
abstract class _$GetUserStudentDataCopyWith<$Res> {
  factory _$GetUserStudentDataCopyWith(
          _GetUserStudentData value, $Res Function(_GetUserStudentData) then) =
      __$GetUserStudentDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetUserStudentDataCopyWithImpl<$Res>
    extends _$RepoEventCopyWithImpl<$Res>
    implements _$GetUserStudentDataCopyWith<$Res> {
  __$GetUserStudentDataCopyWithImpl(
      _GetUserStudentData _value, $Res Function(_GetUserStudentData) _then)
      : super(_value, (v) => _then(v as _GetUserStudentData));

  @override
  _GetUserStudentData get _value => super._value as _GetUserStudentData;
}

/// @nodoc

class _$_GetUserStudentData implements _GetUserStudentData {
  const _$_GetUserStudentData();

  @override
  String toString() {
    return 'RepoEvent.getUserStudentData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetUserStudentData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String queryColumn, String queryData, String rollno)
        updateStudentData,
    required TResult Function() loadAppData,
    required TResult Function() loadUserData,
    required TResult Function() loadPeopleData,
    required TResult Function() loadCouncilData,
    required TResult Function() getAllStudentData,
    required TResult Function() getUserStudentData,
  }) {
    return getUserStudentData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
  }) {
    return getUserStudentData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String queryColumn, String queryData, String rollno)?
        updateStudentData,
    TResult Function()? loadAppData,
    TResult Function()? loadUserData,
    TResult Function()? loadPeopleData,
    TResult Function()? loadCouncilData,
    TResult Function()? getAllStudentData,
    TResult Function()? getUserStudentData,
    required TResult orElse(),
  }) {
    if (getUserStudentData != null) {
      return getUserStudentData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateStudentData value) updateStudentData,
    required TResult Function(_LoadAppData value) loadAppData,
    required TResult Function(_LoadUserData value) loadUserData,
    required TResult Function(_LoadPeopleData value) loadPeopleData,
    required TResult Function(_LoadCouncilData value) loadCouncilData,
    required TResult Function(_GetAllStudentData value) getAllStudentData,
    required TResult Function(_GetUserStudentData value) getUserStudentData,
  }) {
    return getUserStudentData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
  }) {
    return getUserStudentData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateStudentData value)? updateStudentData,
    TResult Function(_LoadAppData value)? loadAppData,
    TResult Function(_LoadUserData value)? loadUserData,
    TResult Function(_LoadPeopleData value)? loadPeopleData,
    TResult Function(_LoadCouncilData value)? loadCouncilData,
    TResult Function(_GetAllStudentData value)? getAllStudentData,
    TResult Function(_GetUserStudentData value)? getUserStudentData,
    required TResult orElse(),
  }) {
    if (getUserStudentData != null) {
      return getUserStudentData(this);
    }
    return orElse();
  }
}

abstract class _GetUserStudentData implements RepoEvent {
  const factory _GetUserStudentData() = _$_GetUserStudentData;
}

/// @nodoc
class _$RepoStateTearOff {
  const _$RepoStateTearOff();

  _RepoState call(
      {required bool isLoading,
      required bool isAppLoading,
      required bool showError,
      required Option<List<List<Post>>> appData,
      required Option<Either<Failure, dynamic>> dbFailureOrSuccess}) {
    return _RepoState(
      isLoading: isLoading,
      isAppLoading: isAppLoading,
      showError: showError,
      appData: appData,
      dbFailureOrSuccess: dbFailureOrSuccess,
    );
  }
}

/// @nodoc
const $RepoState = _$RepoStateTearOff();

/// @nodoc
mixin _$RepoState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAppLoading => throw _privateConstructorUsedError;
  bool get showError => throw _privateConstructorUsedError;
  Option<List<List<Post>>> get appData =>
      throw _privateConstructorUsedError; // required Failure failure,
  Option<Either<Failure, dynamic>> get dbFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoStateCopyWith<RepoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoStateCopyWith<$Res> {
  factory $RepoStateCopyWith(RepoState value, $Res Function(RepoState) then) =
      _$RepoStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isAppLoading,
      bool showError,
      Option<List<List<Post>>> appData,
      Option<Either<Failure, dynamic>> dbFailureOrSuccess});
}

/// @nodoc
class _$RepoStateCopyWithImpl<$Res> implements $RepoStateCopyWith<$Res> {
  _$RepoStateCopyWithImpl(this._value, this._then);

  final RepoState _value;
  // ignore: unused_field
  final $Res Function(RepoState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isAppLoading = freezed,
    Object? showError = freezed,
    Object? appData = freezed,
    Object? dbFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppLoading: isAppLoading == freezed
          ? _value.isAppLoading
          : isAppLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showError: showError == freezed
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      appData: appData == freezed
          ? _value.appData
          : appData // ignore: cast_nullable_to_non_nullable
              as Option<List<List<Post>>>,
      dbFailureOrSuccess: dbFailureOrSuccess == freezed
          ? _value.dbFailureOrSuccess
          : dbFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$RepoStateCopyWith<$Res> implements $RepoStateCopyWith<$Res> {
  factory _$RepoStateCopyWith(
          _RepoState value, $Res Function(_RepoState) then) =
      __$RepoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isAppLoading,
      bool showError,
      Option<List<List<Post>>> appData,
      Option<Either<Failure, dynamic>> dbFailureOrSuccess});
}

/// @nodoc
class __$RepoStateCopyWithImpl<$Res> extends _$RepoStateCopyWithImpl<$Res>
    implements _$RepoStateCopyWith<$Res> {
  __$RepoStateCopyWithImpl(_RepoState _value, $Res Function(_RepoState) _then)
      : super(_value, (v) => _then(v as _RepoState));

  @override
  _RepoState get _value => super._value as _RepoState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isAppLoading = freezed,
    Object? showError = freezed,
    Object? appData = freezed,
    Object? dbFailureOrSuccess = freezed,
  }) {
    return _then(_RepoState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppLoading: isAppLoading == freezed
          ? _value.isAppLoading
          : isAppLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showError: showError == freezed
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      appData: appData == freezed
          ? _value.appData
          : appData // ignore: cast_nullable_to_non_nullable
              as Option<List<List<Post>>>,
      dbFailureOrSuccess: dbFailureOrSuccess == freezed
          ? _value.dbFailureOrSuccess
          : dbFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_RepoState implements _RepoState {
  const _$_RepoState(
      {required this.isLoading,
      required this.isAppLoading,
      required this.showError,
      required this.appData,
      required this.dbFailureOrSuccess});

  @override
  final bool isLoading;
  @override
  final bool isAppLoading;
  @override
  final bool showError;
  @override
  final Option<List<List<Post>>> appData;
  @override // required Failure failure,
  final Option<Either<Failure, dynamic>> dbFailureOrSuccess;

  @override
  String toString() {
    return 'RepoState(isLoading: $isLoading, isAppLoading: $isAppLoading, showError: $showError, appData: $appData, dbFailureOrSuccess: $dbFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RepoState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isAppLoading, isAppLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isAppLoading, isAppLoading)) &&
            (identical(other.showError, showError) ||
                const DeepCollectionEquality()
                    .equals(other.showError, showError)) &&
            (identical(other.appData, appData) ||
                const DeepCollectionEquality()
                    .equals(other.appData, appData)) &&
            (identical(other.dbFailureOrSuccess, dbFailureOrSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.dbFailureOrSuccess, dbFailureOrSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isAppLoading) ^
      const DeepCollectionEquality().hash(showError) ^
      const DeepCollectionEquality().hash(appData) ^
      const DeepCollectionEquality().hash(dbFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  _$RepoStateCopyWith<_RepoState> get copyWith =>
      __$RepoStateCopyWithImpl<_RepoState>(this, _$identity);
}

abstract class _RepoState implements RepoState {
  const factory _RepoState(
          {required bool isLoading,
          required bool isAppLoading,
          required bool showError,
          required Option<List<List<Post>>> appData,
          required Option<Either<Failure, dynamic>> dbFailureOrSuccess}) =
      _$_RepoState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isAppLoading => throw _privateConstructorUsedError;
  @override
  bool get showError => throw _privateConstructorUsedError;
  @override
  Option<List<List<Post>>> get appData => throw _privateConstructorUsedError;
  @override // required Failure failure,
  Option<Either<Failure, dynamic>> get dbFailureOrSuccess =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RepoStateCopyWith<_RepoState> get copyWith =>
      throw _privateConstructorUsedError;
}
