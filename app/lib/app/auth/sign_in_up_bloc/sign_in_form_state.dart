part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required UserName userName,
    required Password password,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
		required bool isAuthenticated,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
      userName: UserName(""),
      password: Password(""),
      showErrorMessages: false,
      isSubmitting: false,
			isAuthenticated: false,
      authFailureOrSuccessOption: none());
}
