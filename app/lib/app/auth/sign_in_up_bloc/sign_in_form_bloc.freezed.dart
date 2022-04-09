// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInFormEventTearOff {
  const _$SignInFormEventTearOff();

  UserNameChanged userNameChanged(String userName) {
    return UserNameChanged(
      userName,
    );
  }

  PasswordChanged passwordChanged(String password) {
    return PasswordChanged(
      password,
    );
  }

  RegisterWithUserNameAndPasswordPressed
      registerWithUserNameAndPasswordPressed() {
    return const RegisterWithUserNameAndPasswordPressed();
  }

  SignInWithUserNameAndPasswordPressed signInWithUserNameAndPasswordPressed() {
    return const SignInWithUserNameAndPasswordPressed();
  }

  ResetPasswordPressed resetPasswordPressed() {
    return const ResetPasswordPressed();
  }

  SendVerificationEmail sendVerificationEmail() {
    return const SendVerificationEmail();
  }

  ResetForm resetForm() {
    return const ResetForm();
  }
}

/// @nodoc
const $SignInFormEvent = _$SignInFormEventTearOff();

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) userNameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() registerWithUserNameAndPasswordPressed,
    required TResult Function() signInWithUserNameAndPasswordPressed,
    required TResult Function() resetPasswordPressed,
    required TResult Function() sendVerificationEmail,
    required TResult Function() resetForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) userNameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithUserNameAndPasswordPressed value)
        registerWithUserNameAndPasswordPressed,
    required TResult Function(SignInWithUserNameAndPasswordPressed value)
        signInWithUserNameAndPasswordPressed,
    required TResult Function(ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(SendVerificationEmail value)
        sendVerificationEmail,
    required TResult Function(ResetForm value) resetForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  final SignInFormEvent _value;
  // ignore: unused_field
  final $Res Function(SignInFormEvent) _then;
}

/// @nodoc
abstract class $UserNameChangedCopyWith<$Res> {
  factory $UserNameChangedCopyWith(
          UserNameChanged value, $Res Function(UserNameChanged) then) =
      _$UserNameChangedCopyWithImpl<$Res>;
  $Res call({String userName});
}

/// @nodoc
class _$UserNameChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $UserNameChangedCopyWith<$Res> {
  _$UserNameChangedCopyWithImpl(
      UserNameChanged _value, $Res Function(UserNameChanged) _then)
      : super(_value, (v) => _then(v as UserNameChanged));

  @override
  UserNameChanged get _value => super._value as UserNameChanged;

  @override
  $Res call({
    Object? userName = freezed,
  }) {
    return _then(UserNameChanged(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserNameChanged implements UserNameChanged {
  const _$UserNameChanged(this.userName);

  @override
  final String userName;

  @override
  String toString() {
    return 'SignInFormEvent.userNameChanged(userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserNameChanged &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userName);

  @JsonKey(ignore: true)
  @override
  $UserNameChangedCopyWith<UserNameChanged> get copyWith =>
      _$UserNameChangedCopyWithImpl<UserNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) userNameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() registerWithUserNameAndPasswordPressed,
    required TResult Function() signInWithUserNameAndPasswordPressed,
    required TResult Function() resetPasswordPressed,
    required TResult Function() sendVerificationEmail,
    required TResult Function() resetForm,
  }) {
    return userNameChanged(userName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
  }) {
    return userNameChanged?.call(userName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) {
    if (userNameChanged != null) {
      return userNameChanged(userName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) userNameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithUserNameAndPasswordPressed value)
        registerWithUserNameAndPasswordPressed,
    required TResult Function(SignInWithUserNameAndPasswordPressed value)
        signInWithUserNameAndPasswordPressed,
    required TResult Function(ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(SendVerificationEmail value)
        sendVerificationEmail,
    required TResult Function(ResetForm value) resetForm,
  }) {
    return userNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
  }) {
    return userNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
    required TResult orElse(),
  }) {
    if (userNameChanged != null) {
      return userNameChanged(this);
    }
    return orElse();
  }
}

abstract class UserNameChanged implements SignInFormEvent {
  const factory UserNameChanged(String userName) = _$UserNameChanged;

  String get userName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserNameChangedCopyWith<UserNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(PasswordChanged(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignInFormEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) userNameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() registerWithUserNameAndPasswordPressed,
    required TResult Function() signInWithUserNameAndPasswordPressed,
    required TResult Function() resetPasswordPressed,
    required TResult Function() sendVerificationEmail,
    required TResult Function() resetForm,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) userNameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithUserNameAndPasswordPressed value)
        registerWithUserNameAndPasswordPressed,
    required TResult Function(SignInWithUserNameAndPasswordPressed value)
        signInWithUserNameAndPasswordPressed,
    required TResult Function(ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(SendVerificationEmail value)
        sendVerificationEmail,
    required TResult Function(ResetForm value) resetForm,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignInFormEvent {
  const factory PasswordChanged(String password) = _$PasswordChanged;

  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterWithUserNameAndPasswordPressedCopyWith<$Res> {
  factory $RegisterWithUserNameAndPasswordPressedCopyWith(
          RegisterWithUserNameAndPasswordPressed value,
          $Res Function(RegisterWithUserNameAndPasswordPressed) then) =
      _$RegisterWithUserNameAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterWithUserNameAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $RegisterWithUserNameAndPasswordPressedCopyWith<$Res> {
  _$RegisterWithUserNameAndPasswordPressedCopyWithImpl(
      RegisterWithUserNameAndPasswordPressed _value,
      $Res Function(RegisterWithUserNameAndPasswordPressed) _then)
      : super(
            _value, (v) => _then(v as RegisterWithUserNameAndPasswordPressed));

  @override
  RegisterWithUserNameAndPasswordPressed get _value =>
      super._value as RegisterWithUserNameAndPasswordPressed;
}

/// @nodoc

class _$RegisterWithUserNameAndPasswordPressed
    implements RegisterWithUserNameAndPasswordPressed {
  const _$RegisterWithUserNameAndPasswordPressed();

  @override
  String toString() {
    return 'SignInFormEvent.registerWithUserNameAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterWithUserNameAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) userNameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() registerWithUserNameAndPasswordPressed,
    required TResult Function() signInWithUserNameAndPasswordPressed,
    required TResult Function() resetPasswordPressed,
    required TResult Function() sendVerificationEmail,
    required TResult Function() resetForm,
  }) {
    return registerWithUserNameAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
  }) {
    return registerWithUserNameAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) {
    if (registerWithUserNameAndPasswordPressed != null) {
      return registerWithUserNameAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) userNameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithUserNameAndPasswordPressed value)
        registerWithUserNameAndPasswordPressed,
    required TResult Function(SignInWithUserNameAndPasswordPressed value)
        signInWithUserNameAndPasswordPressed,
    required TResult Function(ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(SendVerificationEmail value)
        sendVerificationEmail,
    required TResult Function(ResetForm value) resetForm,
  }) {
    return registerWithUserNameAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
  }) {
    return registerWithUserNameAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
    required TResult orElse(),
  }) {
    if (registerWithUserNameAndPasswordPressed != null) {
      return registerWithUserNameAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterWithUserNameAndPasswordPressed
    implements SignInFormEvent {
  const factory RegisterWithUserNameAndPasswordPressed() =
      _$RegisterWithUserNameAndPasswordPressed;
}

/// @nodoc
abstract class $SignInWithUserNameAndPasswordPressedCopyWith<$Res> {
  factory $SignInWithUserNameAndPasswordPressedCopyWith(
          SignInWithUserNameAndPasswordPressed value,
          $Res Function(SignInWithUserNameAndPasswordPressed) then) =
      _$SignInWithUserNameAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithUserNameAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInWithUserNameAndPasswordPressedCopyWith<$Res> {
  _$SignInWithUserNameAndPasswordPressedCopyWithImpl(
      SignInWithUserNameAndPasswordPressed _value,
      $Res Function(SignInWithUserNameAndPasswordPressed) _then)
      : super(_value, (v) => _then(v as SignInWithUserNameAndPasswordPressed));

  @override
  SignInWithUserNameAndPasswordPressed get _value =>
      super._value as SignInWithUserNameAndPasswordPressed;
}

/// @nodoc

class _$SignInWithUserNameAndPasswordPressed
    implements SignInWithUserNameAndPasswordPressed {
  const _$SignInWithUserNameAndPasswordPressed();

  @override
  String toString() {
    return 'SignInFormEvent.signInWithUserNameAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInWithUserNameAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) userNameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() registerWithUserNameAndPasswordPressed,
    required TResult Function() signInWithUserNameAndPasswordPressed,
    required TResult Function() resetPasswordPressed,
    required TResult Function() sendVerificationEmail,
    required TResult Function() resetForm,
  }) {
    return signInWithUserNameAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
  }) {
    return signInWithUserNameAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) {
    if (signInWithUserNameAndPasswordPressed != null) {
      return signInWithUserNameAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) userNameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithUserNameAndPasswordPressed value)
        registerWithUserNameAndPasswordPressed,
    required TResult Function(SignInWithUserNameAndPasswordPressed value)
        signInWithUserNameAndPasswordPressed,
    required TResult Function(ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(SendVerificationEmail value)
        sendVerificationEmail,
    required TResult Function(ResetForm value) resetForm,
  }) {
    return signInWithUserNameAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
  }) {
    return signInWithUserNameAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
    required TResult orElse(),
  }) {
    if (signInWithUserNameAndPasswordPressed != null) {
      return signInWithUserNameAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithUserNameAndPasswordPressed implements SignInFormEvent {
  const factory SignInWithUserNameAndPasswordPressed() =
      _$SignInWithUserNameAndPasswordPressed;
}

/// @nodoc
abstract class $ResetPasswordPressedCopyWith<$Res> {
  factory $ResetPasswordPressedCopyWith(ResetPasswordPressed value,
          $Res Function(ResetPasswordPressed) then) =
      _$ResetPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResetPasswordPressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $ResetPasswordPressedCopyWith<$Res> {
  _$ResetPasswordPressedCopyWithImpl(
      ResetPasswordPressed _value, $Res Function(ResetPasswordPressed) _then)
      : super(_value, (v) => _then(v as ResetPasswordPressed));

  @override
  ResetPasswordPressed get _value => super._value as ResetPasswordPressed;
}

/// @nodoc

class _$ResetPasswordPressed implements ResetPasswordPressed {
  const _$ResetPasswordPressed();

  @override
  String toString() {
    return 'SignInFormEvent.resetPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResetPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) userNameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() registerWithUserNameAndPasswordPressed,
    required TResult Function() signInWithUserNameAndPasswordPressed,
    required TResult Function() resetPasswordPressed,
    required TResult Function() sendVerificationEmail,
    required TResult Function() resetForm,
  }) {
    return resetPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
  }) {
    return resetPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) {
    if (resetPasswordPressed != null) {
      return resetPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) userNameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithUserNameAndPasswordPressed value)
        registerWithUserNameAndPasswordPressed,
    required TResult Function(SignInWithUserNameAndPasswordPressed value)
        signInWithUserNameAndPasswordPressed,
    required TResult Function(ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(SendVerificationEmail value)
        sendVerificationEmail,
    required TResult Function(ResetForm value) resetForm,
  }) {
    return resetPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
  }) {
    return resetPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
    required TResult orElse(),
  }) {
    if (resetPasswordPressed != null) {
      return resetPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordPressed implements SignInFormEvent {
  const factory ResetPasswordPressed() = _$ResetPasswordPressed;
}

/// @nodoc
abstract class $SendVerificationEmailCopyWith<$Res> {
  factory $SendVerificationEmailCopyWith(SendVerificationEmail value,
          $Res Function(SendVerificationEmail) then) =
      _$SendVerificationEmailCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendVerificationEmailCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SendVerificationEmailCopyWith<$Res> {
  _$SendVerificationEmailCopyWithImpl(
      SendVerificationEmail _value, $Res Function(SendVerificationEmail) _then)
      : super(_value, (v) => _then(v as SendVerificationEmail));

  @override
  SendVerificationEmail get _value => super._value as SendVerificationEmail;
}

/// @nodoc

class _$SendVerificationEmail implements SendVerificationEmail {
  const _$SendVerificationEmail();

  @override
  String toString() {
    return 'SignInFormEvent.sendVerificationEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SendVerificationEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) userNameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() registerWithUserNameAndPasswordPressed,
    required TResult Function() signInWithUserNameAndPasswordPressed,
    required TResult Function() resetPasswordPressed,
    required TResult Function() sendVerificationEmail,
    required TResult Function() resetForm,
  }) {
    return sendVerificationEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
  }) {
    return sendVerificationEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) {
    if (sendVerificationEmail != null) {
      return sendVerificationEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) userNameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithUserNameAndPasswordPressed value)
        registerWithUserNameAndPasswordPressed,
    required TResult Function(SignInWithUserNameAndPasswordPressed value)
        signInWithUserNameAndPasswordPressed,
    required TResult Function(ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(SendVerificationEmail value)
        sendVerificationEmail,
    required TResult Function(ResetForm value) resetForm,
  }) {
    return sendVerificationEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
  }) {
    return sendVerificationEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
    required TResult orElse(),
  }) {
    if (sendVerificationEmail != null) {
      return sendVerificationEmail(this);
    }
    return orElse();
  }
}

abstract class SendVerificationEmail implements SignInFormEvent {
  const factory SendVerificationEmail() = _$SendVerificationEmail;
}

/// @nodoc
abstract class $ResetFormCopyWith<$Res> {
  factory $ResetFormCopyWith(ResetForm value, $Res Function(ResetForm) then) =
      _$ResetFormCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResetFormCopyWithImpl<$Res> extends _$SignInFormEventCopyWithImpl<$Res>
    implements $ResetFormCopyWith<$Res> {
  _$ResetFormCopyWithImpl(ResetForm _value, $Res Function(ResetForm) _then)
      : super(_value, (v) => _then(v as ResetForm));

  @override
  ResetForm get _value => super._value as ResetForm;
}

/// @nodoc

class _$ResetForm implements ResetForm {
  const _$ResetForm();

  @override
  String toString() {
    return 'SignInFormEvent.resetForm()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResetForm);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName) userNameChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() registerWithUserNameAndPasswordPressed,
    required TResult Function() signInWithUserNameAndPasswordPressed,
    required TResult Function() resetPasswordPressed,
    required TResult Function() sendVerificationEmail,
    required TResult Function() resetForm,
  }) {
    return resetForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
  }) {
    return resetForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName)? userNameChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? registerWithUserNameAndPasswordPressed,
    TResult Function()? signInWithUserNameAndPasswordPressed,
    TResult Function()? resetPasswordPressed,
    TResult Function()? sendVerificationEmail,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) {
    if (resetForm != null) {
      return resetForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserNameChanged value) userNameChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(RegisterWithUserNameAndPasswordPressed value)
        registerWithUserNameAndPasswordPressed,
    required TResult Function(SignInWithUserNameAndPasswordPressed value)
        signInWithUserNameAndPasswordPressed,
    required TResult Function(ResetPasswordPressed value) resetPasswordPressed,
    required TResult Function(SendVerificationEmail value)
        sendVerificationEmail,
    required TResult Function(ResetForm value) resetForm,
  }) {
    return resetForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
  }) {
    return resetForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserNameChanged value)? userNameChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(RegisterWithUserNameAndPasswordPressed value)?
        registerWithUserNameAndPasswordPressed,
    TResult Function(SignInWithUserNameAndPasswordPressed value)?
        signInWithUserNameAndPasswordPressed,
    TResult Function(ResetPasswordPressed value)? resetPasswordPressed,
    TResult Function(SendVerificationEmail value)? sendVerificationEmail,
    TResult Function(ResetForm value)? resetForm,
    required TResult orElse(),
  }) {
    if (resetForm != null) {
      return resetForm(this);
    }
    return orElse();
  }
}

abstract class ResetForm implements SignInFormEvent {
  const factory ResetForm() = _$ResetForm;
}

/// @nodoc
class _$SignInFormStateTearOff {
  const _$SignInFormStateTearOff();

  _SignInFormState call(
      {required UserName userName,
      required Password password,
      required bool isSubmitting,
      required bool showErrorMessages,
      required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      required bool isAuthenticated}) {
    return _SignInFormState(
      userName: userName,
      password: password,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
      isAuthenticated: isAuthenticated,
    );
  }
}

/// @nodoc
const $SignInFormState = _$SignInFormStateTearOff();

/// @nodoc
mixin _$SignInFormState {
  UserName get userName => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInFormStateCopyWith<SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res>;
  $Res call(
      {UserName userName,
      Password password,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      bool isAuthenticated});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  final SignInFormState _value;
  // ignore: unused_field
  final $Res Function(SignInFormState) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isAuthenticated = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$SignInFormStateCopyWith(
          _SignInFormState value, $Res Function(_SignInFormState) then) =
      __$SignInFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserName userName,
      Password password,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      bool isAuthenticated});
}

/// @nodoc
class __$SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res>
    implements _$SignInFormStateCopyWith<$Res> {
  __$SignInFormStateCopyWithImpl(
      _SignInFormState _value, $Res Function(_SignInFormState) _then)
      : super(_value, (v) => _then(v as _SignInFormState));

  @override
  _SignInFormState get _value => super._value as _SignInFormState;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isAuthenticated = freezed,
  }) {
    return _then(_SignInFormState(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as UserName,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInFormState implements _SignInFormState {
  const _$_SignInFormState(
      {required this.userName,
      required this.password,
      required this.isSubmitting,
      required this.showErrorMessages,
      required this.authFailureOrSuccessOption,
      required this.isAuthenticated});

  @override
  final UserName userName;
  @override
  final Password password;
  @override
  final bool isSubmitting;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;
  @override
  final bool isAuthenticated;

  @override
  String toString() {
    return 'SignInFormState(userName: $userName, password: $password, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, authFailureOrSuccessOption: $authFailureOrSuccessOption, isAuthenticated: $isAuthenticated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInFormState &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                const DeepCollectionEquality()
                    .equals(other.isAuthenticated, isAuthenticated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption) ^
      const DeepCollectionEquality().hash(isAuthenticated);

  @JsonKey(ignore: true)
  @override
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      __$SignInFormStateCopyWithImpl<_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
      {required UserName userName,
      required Password password,
      required bool isSubmitting,
      required bool showErrorMessages,
      required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      required bool isAuthenticated}) = _$_SignInFormState;

  @override
  UserName get userName => throw _privateConstructorUsedError;
  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  bool get isAuthenticated => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
