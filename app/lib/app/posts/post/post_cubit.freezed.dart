// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostStateTearOff {
  const _$PostStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  InitialisingPage initialisingPage() {
    return const InitialisingPage();
  }

  LoadedPage loadedPage(List<PostTile> posts) {
    return LoadedPage(
      posts,
    );
  }

  ToggleBookmark toggleBookmark(PostTile postTile, int index) {
    return ToggleBookmark(
      postTile,
      index,
    );
  }

  ToggingBookmark togglingBookmark(PostTile postTile) {
    return ToggingBookmark(
      postTile,
    );
  }

  ToggleReminder toggleReminder(PostTile postTile) {
    return ToggleReminder(
      postTile,
    );
  }

  Failure failure(DBFailure dbFail, PostFailure f, PostTile postTile) {
    return Failure(
      dbFail,
      f,
      postTile,
    );
  }
}

/// @nodoc
const $PostState = _$PostStateTearOff();

/// @nodoc
mixin _$PostState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialisingPage,
    required TResult Function(List<PostTile> posts) loadedPage,
    required TResult Function(PostTile postTile, int index) toggleBookmark,
    required TResult Function(PostTile postTile) togglingBookmark,
    required TResult Function(PostTile postTile) toggleReminder,
    required TResult Function(
            DBFailure dbFail, PostFailure f, PostTile postTile)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(InitialisingPage value) initialisingPage,
    required TResult Function(LoadedPage value) loadedPage,
    required TResult Function(ToggleBookmark value) toggleBookmark,
    required TResult Function(ToggingBookmark value) togglingBookmark,
    required TResult Function(ToggleReminder value) toggleReminder,
    required TResult Function(Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res> implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  final PostState _value;
  // ignore: unused_field
  final $Res Function(PostState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'PostState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialisingPage,
    required TResult Function(List<PostTile> posts) loadedPage,
    required TResult Function(PostTile postTile, int index) toggleBookmark,
    required TResult Function(PostTile postTile) togglingBookmark,
    required TResult Function(PostTile postTile) toggleReminder,
    required TResult Function(
            DBFailure dbFail, PostFailure f, PostTile postTile)
        failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(InitialisingPage value) initialisingPage,
    required TResult Function(LoadedPage value) loadedPage,
    required TResult Function(ToggleBookmark value) toggleBookmark,
    required TResult Function(ToggingBookmark value) togglingBookmark,
    required TResult Function(ToggleReminder value) toggleReminder,
    required TResult Function(Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class $InitialisingPageCopyWith<$Res> {
  factory $InitialisingPageCopyWith(
          InitialisingPage value, $Res Function(InitialisingPage) then) =
      _$InitialisingPageCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialisingPageCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements $InitialisingPageCopyWith<$Res> {
  _$InitialisingPageCopyWithImpl(
      InitialisingPage _value, $Res Function(InitialisingPage) _then)
      : super(_value, (v) => _then(v as InitialisingPage));

  @override
  InitialisingPage get _value => super._value as InitialisingPage;
}

/// @nodoc

class _$InitialisingPage implements InitialisingPage {
  const _$InitialisingPage();

  @override
  String toString() {
    return 'PostState.initialisingPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialisingPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialisingPage,
    required TResult Function(List<PostTile> posts) loadedPage,
    required TResult Function(PostTile postTile, int index) toggleBookmark,
    required TResult Function(PostTile postTile) togglingBookmark,
    required TResult Function(PostTile postTile) toggleReminder,
    required TResult Function(
            DBFailure dbFail, PostFailure f, PostTile postTile)
        failure,
  }) {
    return initialisingPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
  }) {
    return initialisingPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
    required TResult orElse(),
  }) {
    if (initialisingPage != null) {
      return initialisingPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(InitialisingPage value) initialisingPage,
    required TResult Function(LoadedPage value) loadedPage,
    required TResult Function(ToggleBookmark value) toggleBookmark,
    required TResult Function(ToggingBookmark value) togglingBookmark,
    required TResult Function(ToggleReminder value) toggleReminder,
    required TResult Function(Failure value) failure,
  }) {
    return initialisingPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
  }) {
    return initialisingPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initialisingPage != null) {
      return initialisingPage(this);
    }
    return orElse();
  }
}

abstract class InitialisingPage implements PostState {
  const factory InitialisingPage() = _$InitialisingPage;
}

/// @nodoc
abstract class $LoadedPageCopyWith<$Res> {
  factory $LoadedPageCopyWith(
          LoadedPage value, $Res Function(LoadedPage) then) =
      _$LoadedPageCopyWithImpl<$Res>;
  $Res call({List<PostTile> posts});
}

/// @nodoc
class _$LoadedPageCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements $LoadedPageCopyWith<$Res> {
  _$LoadedPageCopyWithImpl(LoadedPage _value, $Res Function(LoadedPage) _then)
      : super(_value, (v) => _then(v as LoadedPage));

  @override
  LoadedPage get _value => super._value as LoadedPage;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(LoadedPage(
      posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostTile>,
    ));
  }
}

/// @nodoc

class _$LoadedPage implements LoadedPage {
  const _$LoadedPage(this.posts);

  @override
  final List<PostTile> posts;

  @override
  String toString() {
    return 'PostState.loadedPage(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedPage &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(posts);

  @JsonKey(ignore: true)
  @override
  $LoadedPageCopyWith<LoadedPage> get copyWith =>
      _$LoadedPageCopyWithImpl<LoadedPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialisingPage,
    required TResult Function(List<PostTile> posts) loadedPage,
    required TResult Function(PostTile postTile, int index) toggleBookmark,
    required TResult Function(PostTile postTile) togglingBookmark,
    required TResult Function(PostTile postTile) toggleReminder,
    required TResult Function(
            DBFailure dbFail, PostFailure f, PostTile postTile)
        failure,
  }) {
    return loadedPage(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
  }) {
    return loadedPage?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
    required TResult orElse(),
  }) {
    if (loadedPage != null) {
      return loadedPage(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(InitialisingPage value) initialisingPage,
    required TResult Function(LoadedPage value) loadedPage,
    required TResult Function(ToggleBookmark value) toggleBookmark,
    required TResult Function(ToggingBookmark value) togglingBookmark,
    required TResult Function(ToggleReminder value) toggleReminder,
    required TResult Function(Failure value) failure,
  }) {
    return loadedPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
  }) {
    return loadedPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loadedPage != null) {
      return loadedPage(this);
    }
    return orElse();
  }
}

abstract class LoadedPage implements PostState {
  const factory LoadedPage(List<PostTile> posts) = _$LoadedPage;

  List<PostTile> get posts => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedPageCopyWith<LoadedPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleBookmarkCopyWith<$Res> {
  factory $ToggleBookmarkCopyWith(
          ToggleBookmark value, $Res Function(ToggleBookmark) then) =
      _$ToggleBookmarkCopyWithImpl<$Res>;
  $Res call({PostTile postTile, int index});
}

/// @nodoc
class _$ToggleBookmarkCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements $ToggleBookmarkCopyWith<$Res> {
  _$ToggleBookmarkCopyWithImpl(
      ToggleBookmark _value, $Res Function(ToggleBookmark) _then)
      : super(_value, (v) => _then(v as ToggleBookmark));

  @override
  ToggleBookmark get _value => super._value as ToggleBookmark;

  @override
  $Res call({
    Object? postTile = freezed,
    Object? index = freezed,
  }) {
    return _then(ToggleBookmark(
      postTile == freezed
          ? _value.postTile
          : postTile // ignore: cast_nullable_to_non_nullable
              as PostTile,
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ToggleBookmark implements ToggleBookmark {
  const _$ToggleBookmark(this.postTile, this.index);

  @override
  final PostTile postTile;
  @override
  final int index;

  @override
  String toString() {
    return 'PostState.toggleBookmark(postTile: $postTile, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ToggleBookmark &&
            (identical(other.postTile, postTile) ||
                const DeepCollectionEquality()
                    .equals(other.postTile, postTile)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(postTile) ^
      const DeepCollectionEquality().hash(index);

  @JsonKey(ignore: true)
  @override
  $ToggleBookmarkCopyWith<ToggleBookmark> get copyWith =>
      _$ToggleBookmarkCopyWithImpl<ToggleBookmark>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialisingPage,
    required TResult Function(List<PostTile> posts) loadedPage,
    required TResult Function(PostTile postTile, int index) toggleBookmark,
    required TResult Function(PostTile postTile) togglingBookmark,
    required TResult Function(PostTile postTile) toggleReminder,
    required TResult Function(
            DBFailure dbFail, PostFailure f, PostTile postTile)
        failure,
  }) {
    return toggleBookmark(postTile, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
  }) {
    return toggleBookmark?.call(postTile, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
    required TResult orElse(),
  }) {
    if (toggleBookmark != null) {
      return toggleBookmark(postTile, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(InitialisingPage value) initialisingPage,
    required TResult Function(LoadedPage value) loadedPage,
    required TResult Function(ToggleBookmark value) toggleBookmark,
    required TResult Function(ToggingBookmark value) togglingBookmark,
    required TResult Function(ToggleReminder value) toggleReminder,
    required TResult Function(Failure value) failure,
  }) {
    return toggleBookmark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
  }) {
    return toggleBookmark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (toggleBookmark != null) {
      return toggleBookmark(this);
    }
    return orElse();
  }
}

abstract class ToggleBookmark implements PostState {
  const factory ToggleBookmark(PostTile postTile, int index) = _$ToggleBookmark;

  PostTile get postTile => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToggleBookmarkCopyWith<ToggleBookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggingBookmarkCopyWith<$Res> {
  factory $ToggingBookmarkCopyWith(
          ToggingBookmark value, $Res Function(ToggingBookmark) then) =
      _$ToggingBookmarkCopyWithImpl<$Res>;
  $Res call({PostTile postTile});
}

/// @nodoc
class _$ToggingBookmarkCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements $ToggingBookmarkCopyWith<$Res> {
  _$ToggingBookmarkCopyWithImpl(
      ToggingBookmark _value, $Res Function(ToggingBookmark) _then)
      : super(_value, (v) => _then(v as ToggingBookmark));

  @override
  ToggingBookmark get _value => super._value as ToggingBookmark;

  @override
  $Res call({
    Object? postTile = freezed,
  }) {
    return _then(ToggingBookmark(
      postTile == freezed
          ? _value.postTile
          : postTile // ignore: cast_nullable_to_non_nullable
              as PostTile,
    ));
  }
}

/// @nodoc

class _$ToggingBookmark implements ToggingBookmark {
  const _$ToggingBookmark(this.postTile);

  @override
  final PostTile postTile;

  @override
  String toString() {
    return 'PostState.togglingBookmark(postTile: $postTile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ToggingBookmark &&
            (identical(other.postTile, postTile) ||
                const DeepCollectionEquality()
                    .equals(other.postTile, postTile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(postTile);

  @JsonKey(ignore: true)
  @override
  $ToggingBookmarkCopyWith<ToggingBookmark> get copyWith =>
      _$ToggingBookmarkCopyWithImpl<ToggingBookmark>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialisingPage,
    required TResult Function(List<PostTile> posts) loadedPage,
    required TResult Function(PostTile postTile, int index) toggleBookmark,
    required TResult Function(PostTile postTile) togglingBookmark,
    required TResult Function(PostTile postTile) toggleReminder,
    required TResult Function(
            DBFailure dbFail, PostFailure f, PostTile postTile)
        failure,
  }) {
    return togglingBookmark(postTile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
  }) {
    return togglingBookmark?.call(postTile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
    required TResult orElse(),
  }) {
    if (togglingBookmark != null) {
      return togglingBookmark(postTile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(InitialisingPage value) initialisingPage,
    required TResult Function(LoadedPage value) loadedPage,
    required TResult Function(ToggleBookmark value) toggleBookmark,
    required TResult Function(ToggingBookmark value) togglingBookmark,
    required TResult Function(ToggleReminder value) toggleReminder,
    required TResult Function(Failure value) failure,
  }) {
    return togglingBookmark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
  }) {
    return togglingBookmark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (togglingBookmark != null) {
      return togglingBookmark(this);
    }
    return orElse();
  }
}

abstract class ToggingBookmark implements PostState {
  const factory ToggingBookmark(PostTile postTile) = _$ToggingBookmark;

  PostTile get postTile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToggingBookmarkCopyWith<ToggingBookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleReminderCopyWith<$Res> {
  factory $ToggleReminderCopyWith(
          ToggleReminder value, $Res Function(ToggleReminder) then) =
      _$ToggleReminderCopyWithImpl<$Res>;
  $Res call({PostTile postTile});
}

/// @nodoc
class _$ToggleReminderCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements $ToggleReminderCopyWith<$Res> {
  _$ToggleReminderCopyWithImpl(
      ToggleReminder _value, $Res Function(ToggleReminder) _then)
      : super(_value, (v) => _then(v as ToggleReminder));

  @override
  ToggleReminder get _value => super._value as ToggleReminder;

  @override
  $Res call({
    Object? postTile = freezed,
  }) {
    return _then(ToggleReminder(
      postTile == freezed
          ? _value.postTile
          : postTile // ignore: cast_nullable_to_non_nullable
              as PostTile,
    ));
  }
}

/// @nodoc

class _$ToggleReminder implements ToggleReminder {
  const _$ToggleReminder(this.postTile);

  @override
  final PostTile postTile;

  @override
  String toString() {
    return 'PostState.toggleReminder(postTile: $postTile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ToggleReminder &&
            (identical(other.postTile, postTile) ||
                const DeepCollectionEquality()
                    .equals(other.postTile, postTile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(postTile);

  @JsonKey(ignore: true)
  @override
  $ToggleReminderCopyWith<ToggleReminder> get copyWith =>
      _$ToggleReminderCopyWithImpl<ToggleReminder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialisingPage,
    required TResult Function(List<PostTile> posts) loadedPage,
    required TResult Function(PostTile postTile, int index) toggleBookmark,
    required TResult Function(PostTile postTile) togglingBookmark,
    required TResult Function(PostTile postTile) toggleReminder,
    required TResult Function(
            DBFailure dbFail, PostFailure f, PostTile postTile)
        failure,
  }) {
    return toggleReminder(postTile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
  }) {
    return toggleReminder?.call(postTile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
    required TResult orElse(),
  }) {
    if (toggleReminder != null) {
      return toggleReminder(postTile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(InitialisingPage value) initialisingPage,
    required TResult Function(LoadedPage value) loadedPage,
    required TResult Function(ToggleBookmark value) toggleBookmark,
    required TResult Function(ToggingBookmark value) togglingBookmark,
    required TResult Function(ToggleReminder value) toggleReminder,
    required TResult Function(Failure value) failure,
  }) {
    return toggleReminder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
  }) {
    return toggleReminder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (toggleReminder != null) {
      return toggleReminder(this);
    }
    return orElse();
  }
}

abstract class ToggleReminder implements PostState {
  const factory ToggleReminder(PostTile postTile) = _$ToggleReminder;

  PostTile get postTile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToggleReminderCopyWith<ToggleReminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({DBFailure dbFail, PostFailure f, PostTile postTile});

  $DBFailureCopyWith<$Res> get dbFail;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(Failure _value, $Res Function(Failure) _then)
      : super(_value, (v) => _then(v as Failure));

  @override
  Failure get _value => super._value as Failure;

  @override
  $Res call({
    Object? dbFail = freezed,
    Object? f = freezed,
    Object? postTile = freezed,
  }) {
    return _then(Failure(
      dbFail == freezed
          ? _value.dbFail
          : dbFail // ignore: cast_nullable_to_non_nullable
              as DBFailure,
      f == freezed
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as PostFailure,
      postTile == freezed
          ? _value.postTile
          : postTile // ignore: cast_nullable_to_non_nullable
              as PostTile,
    ));
  }

  @override
  $DBFailureCopyWith<$Res> get dbFail {
    return $DBFailureCopyWith<$Res>(_value.dbFail, (value) {
      return _then(_value.copyWith(dbFail: value));
    });
  }
}

/// @nodoc

class _$Failure implements Failure {
  const _$Failure(this.dbFail, this.f, this.postTile);

  @override
  final DBFailure dbFail;
  @override
  final PostFailure f;
  @override
  final PostTile postTile;

  @override
  String toString() {
    return 'PostState.failure(dbFail: $dbFail, f: $f, postTile: $postTile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure &&
            (identical(other.dbFail, dbFail) ||
                const DeepCollectionEquality().equals(other.dbFail, dbFail)) &&
            (identical(other.f, f) ||
                const DeepCollectionEquality().equals(other.f, f)) &&
            (identical(other.postTile, postTile) ||
                const DeepCollectionEquality()
                    .equals(other.postTile, postTile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dbFail) ^
      const DeepCollectionEquality().hash(f) ^
      const DeepCollectionEquality().hash(postTile);

  @JsonKey(ignore: true)
  @override
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialisingPage,
    required TResult Function(List<PostTile> posts) loadedPage,
    required TResult Function(PostTile postTile, int index) toggleBookmark,
    required TResult Function(PostTile postTile) togglingBookmark,
    required TResult Function(PostTile postTile) toggleReminder,
    required TResult Function(
            DBFailure dbFail, PostFailure f, PostTile postTile)
        failure,
  }) {
    return failure(dbFail, f, postTile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
  }) {
    return failure?.call(dbFail, f, postTile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialisingPage,
    TResult Function(List<PostTile> posts)? loadedPage,
    TResult Function(PostTile postTile, int index)? toggleBookmark,
    TResult Function(PostTile postTile)? togglingBookmark,
    TResult Function(PostTile postTile)? toggleReminder,
    TResult Function(DBFailure dbFail, PostFailure f, PostTile postTile)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(dbFail, f, postTile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(InitialisingPage value) initialisingPage,
    required TResult Function(LoadedPage value) loadedPage,
    required TResult Function(ToggleBookmark value) toggleBookmark,
    required TResult Function(ToggingBookmark value) togglingBookmark,
    required TResult Function(ToggleReminder value) toggleReminder,
    required TResult Function(Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(InitialisingPage value)? initialisingPage,
    TResult Function(LoadedPage value)? loadedPage,
    TResult Function(ToggleBookmark value)? toggleBookmark,
    TResult Function(ToggingBookmark value)? togglingBookmark,
    TResult Function(ToggleReminder value)? toggleReminder,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements PostState {
  const factory Failure(DBFailure dbFail, PostFailure f, PostTile postTile) =
      _$Failure;

  DBFailure get dbFail => throw _privateConstructorUsedError;
  PostFailure get f => throw _privateConstructorUsedError;
  PostTile get postTile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}
