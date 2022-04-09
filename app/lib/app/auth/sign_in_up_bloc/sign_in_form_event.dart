part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.userNameChanged(String userName) =
      UserNameChanged;
  const factory SignInFormEvent.passwordChanged(String password) =
      PasswordChanged;
  const factory SignInFormEvent.registerWithUserNameAndPasswordPressed() =
      RegisterWithUserNameAndPasswordPressed;
  const factory SignInFormEvent.signInWithUserNameAndPasswordPressed() =
      SignInWithUserNameAndPasswordPressed;
	const factory SignInFormEvent.resetPasswordPressed() = ResetPasswordPressed;
	const factory SignInFormEvent.sendVerificationEmail() = SendVerificationEmail;
	const factory SignInFormEvent.resetForm() = ResetForm;
}