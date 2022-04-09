// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApiEventTearOff {
  const _$ApiEventTearOff();

  FetchAppData fetchAppData() {
    return const FetchAppData();
  }

  FetchCouncilData fetchCouncilData() {
    return const FetchCouncilData();
  }

  FetchUserData fetchUserData() {
    return const FetchUserData();
  }

  FetchPeopleData fetchPeopleData() {
    return const FetchPeopleData();
  }

  MakeCoordinator makeCoordinator(
      {required String id, required String council, required String sub}) {
    return MakeCoordinator(
      id: id,
      council: council,
      sub: sub,
    );
  }

  UpdatePreferences updatePreferences({required Prefs prefs}) {
    return UpdatePreferences(
      prefs: prefs,
    );
  }

  PublishPost publishPost({required String postUid}) {
    return PublishPost(
      postUid: postUid,
    );
  }

  RequestPostApproval requestPostApproval({required Post post}) {
    return RequestPostApproval(
      post: post,
    );
  }

  UpdatePost updatePost({required Post post}) {
    return UpdatePost(
      post: post,
    );
  }

  MakeDraft makeDraft({required Post post}) {
    return MakeDraft(
      post: post,
    );
  }

  PublishDraft publishDraft({required String postUid}) {
    return PublishDraft(
      postUid: postUid,
    );
  }

  UpdateSUserData updateSUserData(
      {required List<String> reminder, required List<String> bookmark}) {
    return UpdateSUserData(
      reminder: reminder,
      bookmark: bookmark,
    );
  }

  FetchSUserData fetchSUserData(
      {required List<String> reminder, required List<String> bookmark}) {
    return FetchSUserData(
      reminder: reminder,
      bookmark: bookmark,
    );
  }

  FetchAllPost fetchAllPost({required int timeStamp}) {
    return FetchAllPost(
      timeStamp: timeStamp,
    );
  }

  FetchPostWithId fetchPostWithId({required String postUid}) {
    return FetchPostWithId(
      postUid: postUid,
    );
  }

  FetchPostWithTypeCouncil fetchPostWithTypeCouncil(
      {required String type, required String council}) {
    return FetchPostWithTypeCouncil(
      type: type,
      council: council,
    );
  }

  FetchAllStudentsData fetchAllStudentsData() {
    return const FetchAllStudentsData();
  }

  UpdateStudentData updateStudentData(
      {required String rollNo, required MapEntry<String, String> value}) {
    return UpdateStudentData(
      rollNo: rollNo,
      value: value,
    );
  }

  DeletePost deletePost({required Post post}) {
    return DeletePost(
      post: post,
    );
  }
}

/// @nodoc
const $ApiEvent = _$ApiEventTearOff();

/// @nodoc
mixin _$ApiEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiEventCopyWith<$Res> {
  factory $ApiEventCopyWith(ApiEvent value, $Res Function(ApiEvent) then) =
      _$ApiEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApiEventCopyWithImpl<$Res> implements $ApiEventCopyWith<$Res> {
  _$ApiEventCopyWithImpl(this._value, this._then);

  final ApiEvent _value;
  // ignore: unused_field
  final $Res Function(ApiEvent) _then;
}

/// @nodoc
abstract class $FetchAppDataCopyWith<$Res> {
  factory $FetchAppDataCopyWith(
          FetchAppData value, $Res Function(FetchAppData) then) =
      _$FetchAppDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchAppDataCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $FetchAppDataCopyWith<$Res> {
  _$FetchAppDataCopyWithImpl(
      FetchAppData _value, $Res Function(FetchAppData) _then)
      : super(_value, (v) => _then(v as FetchAppData));

  @override
  FetchAppData get _value => super._value as FetchAppData;
}

/// @nodoc

class _$FetchAppData implements FetchAppData {
  const _$FetchAppData();

  @override
  String toString() {
    return 'ApiEvent.fetchAppData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchAppData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return fetchAppData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return fetchAppData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchAppData != null) {
      return fetchAppData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return fetchAppData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return fetchAppData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchAppData != null) {
      return fetchAppData(this);
    }
    return orElse();
  }
}

abstract class FetchAppData implements ApiEvent {
  const factory FetchAppData() = _$FetchAppData;
}

/// @nodoc
abstract class $FetchCouncilDataCopyWith<$Res> {
  factory $FetchCouncilDataCopyWith(
          FetchCouncilData value, $Res Function(FetchCouncilData) then) =
      _$FetchCouncilDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchCouncilDataCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $FetchCouncilDataCopyWith<$Res> {
  _$FetchCouncilDataCopyWithImpl(
      FetchCouncilData _value, $Res Function(FetchCouncilData) _then)
      : super(_value, (v) => _then(v as FetchCouncilData));

  @override
  FetchCouncilData get _value => super._value as FetchCouncilData;
}

/// @nodoc

class _$FetchCouncilData implements FetchCouncilData {
  const _$FetchCouncilData();

  @override
  String toString() {
    return 'ApiEvent.fetchCouncilData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchCouncilData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return fetchCouncilData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return fetchCouncilData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchCouncilData != null) {
      return fetchCouncilData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return fetchCouncilData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return fetchCouncilData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchCouncilData != null) {
      return fetchCouncilData(this);
    }
    return orElse();
  }
}

abstract class FetchCouncilData implements ApiEvent {
  const factory FetchCouncilData() = _$FetchCouncilData;
}

/// @nodoc
abstract class $FetchUserDataCopyWith<$Res> {
  factory $FetchUserDataCopyWith(
          FetchUserData value, $Res Function(FetchUserData) then) =
      _$FetchUserDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchUserDataCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $FetchUserDataCopyWith<$Res> {
  _$FetchUserDataCopyWithImpl(
      FetchUserData _value, $Res Function(FetchUserData) _then)
      : super(_value, (v) => _then(v as FetchUserData));

  @override
  FetchUserData get _value => super._value as FetchUserData;
}

/// @nodoc

class _$FetchUserData implements FetchUserData {
  const _$FetchUserData();

  @override
  String toString() {
    return 'ApiEvent.fetchUserData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchUserData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return fetchUserData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return fetchUserData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchUserData != null) {
      return fetchUserData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return fetchUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return fetchUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchUserData != null) {
      return fetchUserData(this);
    }
    return orElse();
  }
}

abstract class FetchUserData implements ApiEvent {
  const factory FetchUserData() = _$FetchUserData;
}

/// @nodoc
abstract class $FetchPeopleDataCopyWith<$Res> {
  factory $FetchPeopleDataCopyWith(
          FetchPeopleData value, $Res Function(FetchPeopleData) then) =
      _$FetchPeopleDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchPeopleDataCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $FetchPeopleDataCopyWith<$Res> {
  _$FetchPeopleDataCopyWithImpl(
      FetchPeopleData _value, $Res Function(FetchPeopleData) _then)
      : super(_value, (v) => _then(v as FetchPeopleData));

  @override
  FetchPeopleData get _value => super._value as FetchPeopleData;
}

/// @nodoc

class _$FetchPeopleData implements FetchPeopleData {
  const _$FetchPeopleData();

  @override
  String toString() {
    return 'ApiEvent.fetchPeopleData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchPeopleData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return fetchPeopleData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return fetchPeopleData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchPeopleData != null) {
      return fetchPeopleData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return fetchPeopleData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return fetchPeopleData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchPeopleData != null) {
      return fetchPeopleData(this);
    }
    return orElse();
  }
}

abstract class FetchPeopleData implements ApiEvent {
  const factory FetchPeopleData() = _$FetchPeopleData;
}

/// @nodoc
abstract class $MakeCoordinatorCopyWith<$Res> {
  factory $MakeCoordinatorCopyWith(
          MakeCoordinator value, $Res Function(MakeCoordinator) then) =
      _$MakeCoordinatorCopyWithImpl<$Res>;
  $Res call({String id, String council, String sub});
}

/// @nodoc
class _$MakeCoordinatorCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $MakeCoordinatorCopyWith<$Res> {
  _$MakeCoordinatorCopyWithImpl(
      MakeCoordinator _value, $Res Function(MakeCoordinator) _then)
      : super(_value, (v) => _then(v as MakeCoordinator));

  @override
  MakeCoordinator get _value => super._value as MakeCoordinator;

  @override
  $Res call({
    Object? id = freezed,
    Object? council = freezed,
    Object? sub = freezed,
  }) {
    return _then(MakeCoordinator(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      council: council == freezed
          ? _value.council
          : council // ignore: cast_nullable_to_non_nullable
              as String,
      sub: sub == freezed
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MakeCoordinator implements MakeCoordinator {
  const _$MakeCoordinator(
      {required this.id, required this.council, required this.sub});

  @override
  final String id;
  @override
  final String council;
  @override
  final String sub;

  @override
  String toString() {
    return 'ApiEvent.makeCoordinator(id: $id, council: $council, sub: $sub)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MakeCoordinator &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.council, council) ||
                const DeepCollectionEquality()
                    .equals(other.council, council)) &&
            (identical(other.sub, sub) ||
                const DeepCollectionEquality().equals(other.sub, sub)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(council) ^
      const DeepCollectionEquality().hash(sub);

  @JsonKey(ignore: true)
  @override
  $MakeCoordinatorCopyWith<MakeCoordinator> get copyWith =>
      _$MakeCoordinatorCopyWithImpl<MakeCoordinator>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return makeCoordinator(id, council, sub);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return makeCoordinator?.call(id, council, sub);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (makeCoordinator != null) {
      return makeCoordinator(id, council, sub);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return makeCoordinator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return makeCoordinator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (makeCoordinator != null) {
      return makeCoordinator(this);
    }
    return orElse();
  }
}

abstract class MakeCoordinator implements ApiEvent {
  const factory MakeCoordinator(
      {required String id,
      required String council,
      required String sub}) = _$MakeCoordinator;

  String get id => throw _privateConstructorUsedError;
  String get council => throw _privateConstructorUsedError;
  String get sub => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MakeCoordinatorCopyWith<MakeCoordinator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePreferencesCopyWith<$Res> {
  factory $UpdatePreferencesCopyWith(
          UpdatePreferences value, $Res Function(UpdatePreferences) then) =
      _$UpdatePreferencesCopyWithImpl<$Res>;
  $Res call({Prefs prefs});
}

/// @nodoc
class _$UpdatePreferencesCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $UpdatePreferencesCopyWith<$Res> {
  _$UpdatePreferencesCopyWithImpl(
      UpdatePreferences _value, $Res Function(UpdatePreferences) _then)
      : super(_value, (v) => _then(v as UpdatePreferences));

  @override
  UpdatePreferences get _value => super._value as UpdatePreferences;

  @override
  $Res call({
    Object? prefs = freezed,
  }) {
    return _then(UpdatePreferences(
      prefs: prefs == freezed
          ? _value.prefs
          : prefs // ignore: cast_nullable_to_non_nullable
              as Prefs,
    ));
  }
}

/// @nodoc

class _$UpdatePreferences implements UpdatePreferences {
  const _$UpdatePreferences({required this.prefs});

  @override // required Map<String,dynamic> council,
  final Prefs prefs;

  @override
  String toString() {
    return 'ApiEvent.updatePreferences(prefs: $prefs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePreferences &&
            (identical(other.prefs, prefs) ||
                const DeepCollectionEquality().equals(other.prefs, prefs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(prefs);

  @JsonKey(ignore: true)
  @override
  $UpdatePreferencesCopyWith<UpdatePreferences> get copyWith =>
      _$UpdatePreferencesCopyWithImpl<UpdatePreferences>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return updatePreferences(prefs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return updatePreferences?.call(prefs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (updatePreferences != null) {
      return updatePreferences(prefs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return updatePreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return updatePreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (updatePreferences != null) {
      return updatePreferences(this);
    }
    return orElse();
  }
}

abstract class UpdatePreferences implements ApiEvent {
  const factory UpdatePreferences({required Prefs prefs}) = _$UpdatePreferences;

// required Map<String,dynamic> council,
  Prefs get prefs => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePreferencesCopyWith<UpdatePreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublishPostCopyWith<$Res> {
  factory $PublishPostCopyWith(
          PublishPost value, $Res Function(PublishPost) then) =
      _$PublishPostCopyWithImpl<$Res>;
  $Res call({String postUid});
}

/// @nodoc
class _$PublishPostCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $PublishPostCopyWith<$Res> {
  _$PublishPostCopyWithImpl(
      PublishPost _value, $Res Function(PublishPost) _then)
      : super(_value, (v) => _then(v as PublishPost));

  @override
  PublishPost get _value => super._value as PublishPost;

  @override
  $Res call({
    Object? postUid = freezed,
  }) {
    return _then(PublishPost(
      postUid: postUid == freezed
          ? _value.postUid
          : postUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PublishPost implements PublishPost {
  const _$PublishPost({required this.postUid});

  @override
  final String postUid;

  @override
  String toString() {
    return 'ApiEvent.publishPost(postUid: $postUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PublishPost &&
            (identical(other.postUid, postUid) ||
                const DeepCollectionEquality().equals(other.postUid, postUid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(postUid);

  @JsonKey(ignore: true)
  @override
  $PublishPostCopyWith<PublishPost> get copyWith =>
      _$PublishPostCopyWithImpl<PublishPost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return publishPost(postUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return publishPost?.call(postUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (publishPost != null) {
      return publishPost(postUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return publishPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return publishPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (publishPost != null) {
      return publishPost(this);
    }
    return orElse();
  }
}

abstract class PublishPost implements ApiEvent {
  const factory PublishPost({required String postUid}) = _$PublishPost;

  String get postUid => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublishPostCopyWith<PublishPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestPostApprovalCopyWith<$Res> {
  factory $RequestPostApprovalCopyWith(
          RequestPostApproval value, $Res Function(RequestPostApproval) then) =
      _$RequestPostApprovalCopyWithImpl<$Res>;
  $Res call({Post post});
}

/// @nodoc
class _$RequestPostApprovalCopyWithImpl<$Res>
    extends _$ApiEventCopyWithImpl<$Res>
    implements $RequestPostApprovalCopyWith<$Res> {
  _$RequestPostApprovalCopyWithImpl(
      RequestPostApproval _value, $Res Function(RequestPostApproval) _then)
      : super(_value, (v) => _then(v as RequestPostApproval));

  @override
  RequestPostApproval get _value => super._value as RequestPostApproval;

  @override
  $Res call({
    Object? post = freezed,
  }) {
    return _then(RequestPostApproval(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc

class _$RequestPostApproval implements RequestPostApproval {
  const _$RequestPostApproval({required this.post});

  @override
  final Post post;

  @override
  String toString() {
    return 'ApiEvent.requestPostApproval(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RequestPostApproval &&
            (identical(other.post, post) ||
                const DeepCollectionEquality().equals(other.post, post)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(post);

  @JsonKey(ignore: true)
  @override
  $RequestPostApprovalCopyWith<RequestPostApproval> get copyWith =>
      _$RequestPostApprovalCopyWithImpl<RequestPostApproval>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return requestPostApproval(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return requestPostApproval?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (requestPostApproval != null) {
      return requestPostApproval(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return requestPostApproval(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return requestPostApproval?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (requestPostApproval != null) {
      return requestPostApproval(this);
    }
    return orElse();
  }
}

abstract class RequestPostApproval implements ApiEvent {
  const factory RequestPostApproval({required Post post}) =
      _$RequestPostApproval;

  Post get post => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestPostApprovalCopyWith<RequestPostApproval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePostCopyWith<$Res> {
  factory $UpdatePostCopyWith(
          UpdatePost value, $Res Function(UpdatePost) then) =
      _$UpdatePostCopyWithImpl<$Res>;
  $Res call({Post post});
}

/// @nodoc
class _$UpdatePostCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $UpdatePostCopyWith<$Res> {
  _$UpdatePostCopyWithImpl(UpdatePost _value, $Res Function(UpdatePost) _then)
      : super(_value, (v) => _then(v as UpdatePost));

  @override
  UpdatePost get _value => super._value as UpdatePost;

  @override
  $Res call({
    Object? post = freezed,
  }) {
    return _then(UpdatePost(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc

class _$UpdatePost implements UpdatePost {
  const _$UpdatePost({required this.post});

  @override
  final Post post;

  @override
  String toString() {
    return 'ApiEvent.updatePost(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePost &&
            (identical(other.post, post) ||
                const DeepCollectionEquality().equals(other.post, post)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(post);

  @JsonKey(ignore: true)
  @override
  $UpdatePostCopyWith<UpdatePost> get copyWith =>
      _$UpdatePostCopyWithImpl<UpdatePost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return updatePost(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return updatePost?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (updatePost != null) {
      return updatePost(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return updatePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return updatePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (updatePost != null) {
      return updatePost(this);
    }
    return orElse();
  }
}

abstract class UpdatePost implements ApiEvent {
  const factory UpdatePost({required Post post}) = _$UpdatePost;

  Post get post => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePostCopyWith<UpdatePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakeDraftCopyWith<$Res> {
  factory $MakeDraftCopyWith(MakeDraft value, $Res Function(MakeDraft) then) =
      _$MakeDraftCopyWithImpl<$Res>;
  $Res call({Post post});
}

/// @nodoc
class _$MakeDraftCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $MakeDraftCopyWith<$Res> {
  _$MakeDraftCopyWithImpl(MakeDraft _value, $Res Function(MakeDraft) _then)
      : super(_value, (v) => _then(v as MakeDraft));

  @override
  MakeDraft get _value => super._value as MakeDraft;

  @override
  $Res call({
    Object? post = freezed,
  }) {
    return _then(MakeDraft(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc

class _$MakeDraft implements MakeDraft {
  const _$MakeDraft({required this.post});

  @override
  final Post post;

  @override
  String toString() {
    return 'ApiEvent.makeDraft(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MakeDraft &&
            (identical(other.post, post) ||
                const DeepCollectionEquality().equals(other.post, post)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(post);

  @JsonKey(ignore: true)
  @override
  $MakeDraftCopyWith<MakeDraft> get copyWith =>
      _$MakeDraftCopyWithImpl<MakeDraft>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return makeDraft(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return makeDraft?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (makeDraft != null) {
      return makeDraft(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return makeDraft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return makeDraft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (makeDraft != null) {
      return makeDraft(this);
    }
    return orElse();
  }
}

abstract class MakeDraft implements ApiEvent {
  const factory MakeDraft({required Post post}) = _$MakeDraft;

  Post get post => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MakeDraftCopyWith<MakeDraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublishDraftCopyWith<$Res> {
  factory $PublishDraftCopyWith(
          PublishDraft value, $Res Function(PublishDraft) then) =
      _$PublishDraftCopyWithImpl<$Res>;
  $Res call({String postUid});
}

/// @nodoc
class _$PublishDraftCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $PublishDraftCopyWith<$Res> {
  _$PublishDraftCopyWithImpl(
      PublishDraft _value, $Res Function(PublishDraft) _then)
      : super(_value, (v) => _then(v as PublishDraft));

  @override
  PublishDraft get _value => super._value as PublishDraft;

  @override
  $Res call({
    Object? postUid = freezed,
  }) {
    return _then(PublishDraft(
      postUid: postUid == freezed
          ? _value.postUid
          : postUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PublishDraft implements PublishDraft {
  const _$PublishDraft({required this.postUid});

  @override
  final String postUid;

  @override
  String toString() {
    return 'ApiEvent.publishDraft(postUid: $postUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PublishDraft &&
            (identical(other.postUid, postUid) ||
                const DeepCollectionEquality().equals(other.postUid, postUid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(postUid);

  @JsonKey(ignore: true)
  @override
  $PublishDraftCopyWith<PublishDraft> get copyWith =>
      _$PublishDraftCopyWithImpl<PublishDraft>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return publishDraft(postUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return publishDraft?.call(postUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (publishDraft != null) {
      return publishDraft(postUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return publishDraft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return publishDraft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (publishDraft != null) {
      return publishDraft(this);
    }
    return orElse();
  }
}

abstract class PublishDraft implements ApiEvent {
  const factory PublishDraft({required String postUid}) = _$PublishDraft;

  String get postUid => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublishDraftCopyWith<PublishDraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSUserDataCopyWith<$Res> {
  factory $UpdateSUserDataCopyWith(
          UpdateSUserData value, $Res Function(UpdateSUserData) then) =
      _$UpdateSUserDataCopyWithImpl<$Res>;
  $Res call({List<String> reminder, List<String> bookmark});
}

/// @nodoc
class _$UpdateSUserDataCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $UpdateSUserDataCopyWith<$Res> {
  _$UpdateSUserDataCopyWithImpl(
      UpdateSUserData _value, $Res Function(UpdateSUserData) _then)
      : super(_value, (v) => _then(v as UpdateSUserData));

  @override
  UpdateSUserData get _value => super._value as UpdateSUserData;

  @override
  $Res call({
    Object? reminder = freezed,
    Object? bookmark = freezed,
  }) {
    return _then(UpdateSUserData(
      reminder: reminder == freezed
          ? _value.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookmark: bookmark == freezed
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$UpdateSUserData implements UpdateSUserData {
  const _$UpdateSUserData({required this.reminder, required this.bookmark});

  @override
  final List<String> reminder;
  @override
  final List<String> bookmark;

  @override
  String toString() {
    return 'ApiEvent.updateSUserData(reminder: $reminder, bookmark: $bookmark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateSUserData &&
            (identical(other.reminder, reminder) ||
                const DeepCollectionEquality()
                    .equals(other.reminder, reminder)) &&
            (identical(other.bookmark, bookmark) ||
                const DeepCollectionEquality()
                    .equals(other.bookmark, bookmark)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reminder) ^
      const DeepCollectionEquality().hash(bookmark);

  @JsonKey(ignore: true)
  @override
  $UpdateSUserDataCopyWith<UpdateSUserData> get copyWith =>
      _$UpdateSUserDataCopyWithImpl<UpdateSUserData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return updateSUserData(reminder, bookmark);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return updateSUserData?.call(reminder, bookmark);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (updateSUserData != null) {
      return updateSUserData(reminder, bookmark);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return updateSUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return updateSUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (updateSUserData != null) {
      return updateSUserData(this);
    }
    return orElse();
  }
}

abstract class UpdateSUserData implements ApiEvent {
  const factory UpdateSUserData(
      {required List<String> reminder,
      required List<String> bookmark}) = _$UpdateSUserData;

  List<String> get reminder => throw _privateConstructorUsedError;
  List<String> get bookmark => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateSUserDataCopyWith<UpdateSUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchSUserDataCopyWith<$Res> {
  factory $FetchSUserDataCopyWith(
          FetchSUserData value, $Res Function(FetchSUserData) then) =
      _$FetchSUserDataCopyWithImpl<$Res>;
  $Res call({List<String> reminder, List<String> bookmark});
}

/// @nodoc
class _$FetchSUserDataCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $FetchSUserDataCopyWith<$Res> {
  _$FetchSUserDataCopyWithImpl(
      FetchSUserData _value, $Res Function(FetchSUserData) _then)
      : super(_value, (v) => _then(v as FetchSUserData));

  @override
  FetchSUserData get _value => super._value as FetchSUserData;

  @override
  $Res call({
    Object? reminder = freezed,
    Object? bookmark = freezed,
  }) {
    return _then(FetchSUserData(
      reminder: reminder == freezed
          ? _value.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookmark: bookmark == freezed
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$FetchSUserData implements FetchSUserData {
  const _$FetchSUserData({required this.reminder, required this.bookmark});

  @override
  final List<String> reminder;
  @override
  final List<String> bookmark;

  @override
  String toString() {
    return 'ApiEvent.fetchSUserData(reminder: $reminder, bookmark: $bookmark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchSUserData &&
            (identical(other.reminder, reminder) ||
                const DeepCollectionEquality()
                    .equals(other.reminder, reminder)) &&
            (identical(other.bookmark, bookmark) ||
                const DeepCollectionEquality()
                    .equals(other.bookmark, bookmark)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reminder) ^
      const DeepCollectionEquality().hash(bookmark);

  @JsonKey(ignore: true)
  @override
  $FetchSUserDataCopyWith<FetchSUserData> get copyWith =>
      _$FetchSUserDataCopyWithImpl<FetchSUserData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return fetchSUserData(reminder, bookmark);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return fetchSUserData?.call(reminder, bookmark);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchSUserData != null) {
      return fetchSUserData(reminder, bookmark);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return fetchSUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return fetchSUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchSUserData != null) {
      return fetchSUserData(this);
    }
    return orElse();
  }
}

abstract class FetchSUserData implements ApiEvent {
  const factory FetchSUserData(
      {required List<String> reminder,
      required List<String> bookmark}) = _$FetchSUserData;

  List<String> get reminder => throw _privateConstructorUsedError;
  List<String> get bookmark => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchSUserDataCopyWith<FetchSUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchAllPostCopyWith<$Res> {
  factory $FetchAllPostCopyWith(
          FetchAllPost value, $Res Function(FetchAllPost) then) =
      _$FetchAllPostCopyWithImpl<$Res>;
  $Res call({int timeStamp});
}

/// @nodoc
class _$FetchAllPostCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $FetchAllPostCopyWith<$Res> {
  _$FetchAllPostCopyWithImpl(
      FetchAllPost _value, $Res Function(FetchAllPost) _then)
      : super(_value, (v) => _then(v as FetchAllPost));

  @override
  FetchAllPost get _value => super._value as FetchAllPost;

  @override
  $Res call({
    Object? timeStamp = freezed,
  }) {
    return _then(FetchAllPost(
      timeStamp: timeStamp == freezed
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchAllPost implements FetchAllPost {
  const _$FetchAllPost({required this.timeStamp});

  @override
  final int timeStamp;

  @override
  String toString() {
    return 'ApiEvent.fetchAllPost(timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchAllPost &&
            (identical(other.timeStamp, timeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.timeStamp, timeStamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(timeStamp);

  @JsonKey(ignore: true)
  @override
  $FetchAllPostCopyWith<FetchAllPost> get copyWith =>
      _$FetchAllPostCopyWithImpl<FetchAllPost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return fetchAllPost(timeStamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return fetchAllPost?.call(timeStamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchAllPost != null) {
      return fetchAllPost(timeStamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return fetchAllPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return fetchAllPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchAllPost != null) {
      return fetchAllPost(this);
    }
    return orElse();
  }
}

abstract class FetchAllPost implements ApiEvent {
  const factory FetchAllPost({required int timeStamp}) = _$FetchAllPost;

  int get timeStamp => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchAllPostCopyWith<FetchAllPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchPostWithIdCopyWith<$Res> {
  factory $FetchPostWithIdCopyWith(
          FetchPostWithId value, $Res Function(FetchPostWithId) then) =
      _$FetchPostWithIdCopyWithImpl<$Res>;
  $Res call({String postUid});
}

/// @nodoc
class _$FetchPostWithIdCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $FetchPostWithIdCopyWith<$Res> {
  _$FetchPostWithIdCopyWithImpl(
      FetchPostWithId _value, $Res Function(FetchPostWithId) _then)
      : super(_value, (v) => _then(v as FetchPostWithId));

  @override
  FetchPostWithId get _value => super._value as FetchPostWithId;

  @override
  $Res call({
    Object? postUid = freezed,
  }) {
    return _then(FetchPostWithId(
      postUid: postUid == freezed
          ? _value.postUid
          : postUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchPostWithId implements FetchPostWithId {
  const _$FetchPostWithId({required this.postUid});

  @override
  final String postUid;

  @override
  String toString() {
    return 'ApiEvent.fetchPostWithId(postUid: $postUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchPostWithId &&
            (identical(other.postUid, postUid) ||
                const DeepCollectionEquality().equals(other.postUid, postUid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(postUid);

  @JsonKey(ignore: true)
  @override
  $FetchPostWithIdCopyWith<FetchPostWithId> get copyWith =>
      _$FetchPostWithIdCopyWithImpl<FetchPostWithId>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return fetchPostWithId(postUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return fetchPostWithId?.call(postUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchPostWithId != null) {
      return fetchPostWithId(postUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return fetchPostWithId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return fetchPostWithId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchPostWithId != null) {
      return fetchPostWithId(this);
    }
    return orElse();
  }
}

abstract class FetchPostWithId implements ApiEvent {
  const factory FetchPostWithId({required String postUid}) = _$FetchPostWithId;

  String get postUid => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchPostWithIdCopyWith<FetchPostWithId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchPostWithTypeCouncilCopyWith<$Res> {
  factory $FetchPostWithTypeCouncilCopyWith(FetchPostWithTypeCouncil value,
          $Res Function(FetchPostWithTypeCouncil) then) =
      _$FetchPostWithTypeCouncilCopyWithImpl<$Res>;
  $Res call({String type, String council});
}

/// @nodoc
class _$FetchPostWithTypeCouncilCopyWithImpl<$Res>
    extends _$ApiEventCopyWithImpl<$Res>
    implements $FetchPostWithTypeCouncilCopyWith<$Res> {
  _$FetchPostWithTypeCouncilCopyWithImpl(FetchPostWithTypeCouncil _value,
      $Res Function(FetchPostWithTypeCouncil) _then)
      : super(_value, (v) => _then(v as FetchPostWithTypeCouncil));

  @override
  FetchPostWithTypeCouncil get _value =>
      super._value as FetchPostWithTypeCouncil;

  @override
  $Res call({
    Object? type = freezed,
    Object? council = freezed,
  }) {
    return _then(FetchPostWithTypeCouncil(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      council: council == freezed
          ? _value.council
          : council // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchPostWithTypeCouncil implements FetchPostWithTypeCouncil {
  const _$FetchPostWithTypeCouncil({required this.type, required this.council});

  @override
  final String type;
  @override
  final String council;

  @override
  String toString() {
    return 'ApiEvent.fetchPostWithTypeCouncil(type: $type, council: $council)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchPostWithTypeCouncil &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.council, council) ||
                const DeepCollectionEquality().equals(other.council, council)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(council);

  @JsonKey(ignore: true)
  @override
  $FetchPostWithTypeCouncilCopyWith<FetchPostWithTypeCouncil> get copyWith =>
      _$FetchPostWithTypeCouncilCopyWithImpl<FetchPostWithTypeCouncil>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return fetchPostWithTypeCouncil(type, council);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return fetchPostWithTypeCouncil?.call(type, council);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchPostWithTypeCouncil != null) {
      return fetchPostWithTypeCouncil(type, council);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return fetchPostWithTypeCouncil(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return fetchPostWithTypeCouncil?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchPostWithTypeCouncil != null) {
      return fetchPostWithTypeCouncil(this);
    }
    return orElse();
  }
}

abstract class FetchPostWithTypeCouncil implements ApiEvent {
  const factory FetchPostWithTypeCouncil(
      {required String type,
      required String council}) = _$FetchPostWithTypeCouncil;

  String get type => throw _privateConstructorUsedError;
  String get council => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchPostWithTypeCouncilCopyWith<FetchPostWithTypeCouncil> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchAllStudentsDataCopyWith<$Res> {
  factory $FetchAllStudentsDataCopyWith(FetchAllStudentsData value,
          $Res Function(FetchAllStudentsData) then) =
      _$FetchAllStudentsDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchAllStudentsDataCopyWithImpl<$Res>
    extends _$ApiEventCopyWithImpl<$Res>
    implements $FetchAllStudentsDataCopyWith<$Res> {
  _$FetchAllStudentsDataCopyWithImpl(
      FetchAllStudentsData _value, $Res Function(FetchAllStudentsData) _then)
      : super(_value, (v) => _then(v as FetchAllStudentsData));

  @override
  FetchAllStudentsData get _value => super._value as FetchAllStudentsData;
}

/// @nodoc

class _$FetchAllStudentsData implements FetchAllStudentsData {
  const _$FetchAllStudentsData();

  @override
  String toString() {
    return 'ApiEvent.fetchAllStudentsData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchAllStudentsData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return fetchAllStudentsData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return fetchAllStudentsData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchAllStudentsData != null) {
      return fetchAllStudentsData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return fetchAllStudentsData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return fetchAllStudentsData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchAllStudentsData != null) {
      return fetchAllStudentsData(this);
    }
    return orElse();
  }
}

abstract class FetchAllStudentsData implements ApiEvent {
  const factory FetchAllStudentsData() = _$FetchAllStudentsData;
}

/// @nodoc
abstract class $UpdateStudentDataCopyWith<$Res> {
  factory $UpdateStudentDataCopyWith(
          UpdateStudentData value, $Res Function(UpdateStudentData) then) =
      _$UpdateStudentDataCopyWithImpl<$Res>;
  $Res call({String rollNo, MapEntry<String, String> value});
}

/// @nodoc
class _$UpdateStudentDataCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $UpdateStudentDataCopyWith<$Res> {
  _$UpdateStudentDataCopyWithImpl(
      UpdateStudentData _value, $Res Function(UpdateStudentData) _then)
      : super(_value, (v) => _then(v as UpdateStudentData));

  @override
  UpdateStudentData get _value => super._value as UpdateStudentData;

  @override
  $Res call({
    Object? rollNo = freezed,
    Object? value = freezed,
  }) {
    return _then(UpdateStudentData(
      rollNo: rollNo == freezed
          ? _value.rollNo
          : rollNo // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MapEntry<String, String>,
    ));
  }
}

/// @nodoc

class _$UpdateStudentData implements UpdateStudentData {
  const _$UpdateStudentData({required this.rollNo, required this.value});

  @override
  final String rollNo;
  @override
  final MapEntry<String, String> value;

  @override
  String toString() {
    return 'ApiEvent.updateStudentData(rollNo: $rollNo, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateStudentData &&
            (identical(other.rollNo, rollNo) ||
                const DeepCollectionEquality().equals(other.rollNo, rollNo)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rollNo) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $UpdateStudentDataCopyWith<UpdateStudentData> get copyWith =>
      _$UpdateStudentDataCopyWithImpl<UpdateStudentData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return updateStudentData(rollNo, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return updateStudentData?.call(rollNo, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (updateStudentData != null) {
      return updateStudentData(rollNo, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return updateStudentData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return updateStudentData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (updateStudentData != null) {
      return updateStudentData(this);
    }
    return orElse();
  }
}

abstract class UpdateStudentData implements ApiEvent {
  const factory UpdateStudentData(
      {required String rollNo,
      required MapEntry<String, String> value}) = _$UpdateStudentData;

  String get rollNo => throw _privateConstructorUsedError;
  MapEntry<String, String> get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateStudentDataCopyWith<UpdateStudentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletePostCopyWith<$Res> {
  factory $DeletePostCopyWith(
          DeletePost value, $Res Function(DeletePost) then) =
      _$DeletePostCopyWithImpl<$Res>;
  $Res call({Post post});
}

/// @nodoc
class _$DeletePostCopyWithImpl<$Res> extends _$ApiEventCopyWithImpl<$Res>
    implements $DeletePostCopyWith<$Res> {
  _$DeletePostCopyWithImpl(DeletePost _value, $Res Function(DeletePost) _then)
      : super(_value, (v) => _then(v as DeletePost));

  @override
  DeletePost get _value => super._value as DeletePost;

  @override
  $Res call({
    Object? post = freezed,
  }) {
    return _then(DeletePost(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc

class _$DeletePost implements DeletePost {
  const _$DeletePost({required this.post});

  @override
  final Post post;

  @override
  String toString() {
    return 'ApiEvent.deletePost(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeletePost &&
            (identical(other.post, post) ||
                const DeepCollectionEquality().equals(other.post, post)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(post);

  @JsonKey(ignore: true)
  @override
  $DeletePostCopyWith<DeletePost> get copyWith =>
      _$DeletePostCopyWithImpl<DeletePost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAppData,
    required TResult Function() fetchCouncilData,
    required TResult Function() fetchUserData,
    required TResult Function() fetchPeopleData,
    required TResult Function(String id, String council, String sub)
        makeCoordinator,
    required TResult Function(Prefs prefs) updatePreferences,
    required TResult Function(String postUid) publishPost,
    required TResult Function(Post post) requestPostApproval,
    required TResult Function(Post post) updatePost,
    required TResult Function(Post post) makeDraft,
    required TResult Function(String postUid) publishDraft,
    required TResult Function(List<String> reminder, List<String> bookmark)
        updateSUserData,
    required TResult Function(List<String> reminder, List<String> bookmark)
        fetchSUserData,
    required TResult Function(int timeStamp) fetchAllPost,
    required TResult Function(String postUid) fetchPostWithId,
    required TResult Function(String type, String council)
        fetchPostWithTypeCouncil,
    required TResult Function() fetchAllStudentsData,
    required TResult Function(String rollNo, MapEntry<String, String> value)
        updateStudentData,
    required TResult Function(Post post) deletePost,
  }) {
    return deletePost(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
  }) {
    return deletePost?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAppData,
    TResult Function()? fetchCouncilData,
    TResult Function()? fetchUserData,
    TResult Function()? fetchPeopleData,
    TResult Function(String id, String council, String sub)? makeCoordinator,
    TResult Function(Prefs prefs)? updatePreferences,
    TResult Function(String postUid)? publishPost,
    TResult Function(Post post)? requestPostApproval,
    TResult Function(Post post)? updatePost,
    TResult Function(Post post)? makeDraft,
    TResult Function(String postUid)? publishDraft,
    TResult Function(List<String> reminder, List<String> bookmark)?
        updateSUserData,
    TResult Function(List<String> reminder, List<String> bookmark)?
        fetchSUserData,
    TResult Function(int timeStamp)? fetchAllPost,
    TResult Function(String postUid)? fetchPostWithId,
    TResult Function(String type, String council)? fetchPostWithTypeCouncil,
    TResult Function()? fetchAllStudentsData,
    TResult Function(String rollNo, MapEntry<String, String> value)?
        updateStudentData,
    TResult Function(Post post)? deletePost,
    required TResult orElse(),
  }) {
    if (deletePost != null) {
      return deletePost(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAppData value) fetchAppData,
    required TResult Function(FetchCouncilData value) fetchCouncilData,
    required TResult Function(FetchUserData value) fetchUserData,
    required TResult Function(FetchPeopleData value) fetchPeopleData,
    required TResult Function(MakeCoordinator value) makeCoordinator,
    required TResult Function(UpdatePreferences value) updatePreferences,
    required TResult Function(PublishPost value) publishPost,
    required TResult Function(RequestPostApproval value) requestPostApproval,
    required TResult Function(UpdatePost value) updatePost,
    required TResult Function(MakeDraft value) makeDraft,
    required TResult Function(PublishDraft value) publishDraft,
    required TResult Function(UpdateSUserData value) updateSUserData,
    required TResult Function(FetchSUserData value) fetchSUserData,
    required TResult Function(FetchAllPost value) fetchAllPost,
    required TResult Function(FetchPostWithId value) fetchPostWithId,
    required TResult Function(FetchPostWithTypeCouncil value)
        fetchPostWithTypeCouncil,
    required TResult Function(FetchAllStudentsData value) fetchAllStudentsData,
    required TResult Function(UpdateStudentData value) updateStudentData,
    required TResult Function(DeletePost value) deletePost,
  }) {
    return deletePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
  }) {
    return deletePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAppData value)? fetchAppData,
    TResult Function(FetchCouncilData value)? fetchCouncilData,
    TResult Function(FetchUserData value)? fetchUserData,
    TResult Function(FetchPeopleData value)? fetchPeopleData,
    TResult Function(MakeCoordinator value)? makeCoordinator,
    TResult Function(UpdatePreferences value)? updatePreferences,
    TResult Function(PublishPost value)? publishPost,
    TResult Function(RequestPostApproval value)? requestPostApproval,
    TResult Function(UpdatePost value)? updatePost,
    TResult Function(MakeDraft value)? makeDraft,
    TResult Function(PublishDraft value)? publishDraft,
    TResult Function(UpdateSUserData value)? updateSUserData,
    TResult Function(FetchSUserData value)? fetchSUserData,
    TResult Function(FetchAllPost value)? fetchAllPost,
    TResult Function(FetchPostWithId value)? fetchPostWithId,
    TResult Function(FetchPostWithTypeCouncil value)? fetchPostWithTypeCouncil,
    TResult Function(FetchAllStudentsData value)? fetchAllStudentsData,
    TResult Function(UpdateStudentData value)? updateStudentData,
    TResult Function(DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (deletePost != null) {
      return deletePost(this);
    }
    return orElse();
  }
}

abstract class DeletePost implements ApiEvent {
  const factory DeletePost({required Post post}) = _$DeletePost;

  Post get post => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeletePostCopyWith<DeletePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ApiStateTearOff {
  const _$ApiStateTearOff();

  _ApiState call(
      {required Set<API> load,
      required Option<dynamic> value,
      required Option<Either<ApiFailure, Unit>> apiFailureOrSuccessOption}) {
    return _ApiState(
      load: load,
      value: value,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $ApiState = _$ApiStateTearOff();

/// @nodoc
mixin _$ApiState {
// required bool loadInProgress,
// required API apiType,
  Set<API> get load => throw _privateConstructorUsedError;
  Option<dynamic> get value => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, Unit>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiStateCopyWith<ApiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiStateCopyWith<$Res> {
  factory $ApiStateCopyWith(ApiState value, $Res Function(ApiState) then) =
      _$ApiStateCopyWithImpl<$Res>;
  $Res call(
      {Set<API> load,
      Option<dynamic> value,
      Option<Either<ApiFailure, Unit>> apiFailureOrSuccessOption});
}

/// @nodoc
class _$ApiStateCopyWithImpl<$Res> implements $ApiStateCopyWith<$Res> {
  _$ApiStateCopyWithImpl(this._value, this._then);

  final ApiState _value;
  // ignore: unused_field
  final $Res Function(ApiState) _then;

  @override
  $Res call({
    Object? load = freezed,
    Object? value = freezed,
    Object? apiFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      load: load == freezed
          ? _value.load
          : load // ignore: cast_nullable_to_non_nullable
              as Set<API>,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$ApiStateCopyWith<$Res> implements $ApiStateCopyWith<$Res> {
  factory _$ApiStateCopyWith(_ApiState value, $Res Function(_ApiState) then) =
      __$ApiStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Set<API> load,
      Option<dynamic> value,
      Option<Either<ApiFailure, Unit>> apiFailureOrSuccessOption});
}

/// @nodoc
class __$ApiStateCopyWithImpl<$Res> extends _$ApiStateCopyWithImpl<$Res>
    implements _$ApiStateCopyWith<$Res> {
  __$ApiStateCopyWithImpl(_ApiState _value, $Res Function(_ApiState) _then)
      : super(_value, (v) => _then(v as _ApiState));

  @override
  _ApiState get _value => super._value as _ApiState;

  @override
  $Res call({
    Object? load = freezed,
    Object? value = freezed,
    Object? apiFailureOrSuccessOption = freezed,
  }) {
    return _then(_ApiState(
      load: load == freezed
          ? _value.load
          : load // ignore: cast_nullable_to_non_nullable
              as Set<API>,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Option<dynamic>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ApiState implements _ApiState {
  const _$_ApiState(
      {required this.load,
      required this.value,
      required this.apiFailureOrSuccessOption});

  @override // required bool loadInProgress,
// required API apiType,
  final Set<API> load;
  @override
  final Option<dynamic> value;
  @override
  final Option<Either<ApiFailure, Unit>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'ApiState(load: $load, value: $value, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApiState &&
            (identical(other.load, load) ||
                const DeepCollectionEquality().equals(other.load, load)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(load) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$ApiStateCopyWith<_ApiState> get copyWith =>
      __$ApiStateCopyWithImpl<_ApiState>(this, _$identity);
}

abstract class _ApiState implements ApiState {
  const factory _ApiState(
      {required Set<API> load,
      required Option<dynamic> value,
      required Option<Either<ApiFailure, Unit>>
          apiFailureOrSuccessOption}) = _$_ApiState;

  @override // required bool loadInProgress,
// required API apiType,
  Set<API> get load => throw _privateConstructorUsedError;
  @override
  Option<dynamic> get value => throw _privateConstructorUsedError;
  @override
  Option<Either<ApiFailure, Unit>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApiStateCopyWith<_ApiState> get copyWith =>
      throw _privateConstructorUsedError;
}
