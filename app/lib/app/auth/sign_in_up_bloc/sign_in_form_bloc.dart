import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/auth_interface.dart';
import '../../../domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final AuthInterface _authInterface;

  SignInFormBloc(this._authInterface) : super(SignInFormState.initial());

  // @override
  // SignInFormState get initalState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
        userNameChanged: (e) async* {
          yield state.copyWith(
              userName: UserName(e.userName),
							isAuthenticated: false,
              authFailureOrSuccessOption: none());
        },
        passwordChanged: (e) async* {
          yield state.copyWith(
              password: Password(e.password),
							isAuthenticated: false,
              authFailureOrSuccessOption: none());
        },
        registerWithUserNameAndPasswordPressed: (e) async* {
          yield* _performActionOnAuthInterfaceWithEmailAndPassword(
              _authInterface.registerWithUserNameAndPassword, true);
        },
        signInWithUserNameAndPasswordPressed: (e) async* {
          yield* _performActionOnAuthInterfaceWithEmailAndPassword(
              _authInterface.signInWithUserNameAndPassword, false);
        },
        resetPasswordPressed: (e) async* {
          Either<AuthFailure, Unit>? failureOrSuccess;
          if (state.userName.isValid()) {
            yield state.copyWith(
                isSubmitting: true,
							isAuthenticated: false, authFailureOrSuccessOption: none());
            failureOrSuccess =
                await _authInterface.resetPassword(userName: state.userName);
          }
          yield state.copyWith(
              isSubmitting: false,
              showErrorMessages: true,
							isAuthenticated: false,
              authFailureOrSuccessOption: optionOf(failureOrSuccess));
        },
        sendVerificationEmail: (e) async* {
					// yield state.copyWith(
          //     showErrorMessages: true,
					// 		isAuthenticated: false,);
					final failureOrSuccess = await _authInterface.sendVerificationEmail();
					yield state.copyWith(
              isSubmitting: false,
							isAuthenticated: false,
              showErrorMessages: true,
              authFailureOrSuccessOption: optionOf(failureOrSuccess));
				},
				resetForm: (e) async* {
					yield SignInFormState.initial();
				}
			);
  }

  Stream<SignInFormState> _performActionOnAuthInterfaceWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function(
            {required UserName userName, required Password password})
        forwardedCall, bool isSignUp
  ) async* {
    Either<AuthFailure, Unit> ?failureOrSuccess;
    if (state.userName.isValid() && state.password.isValid()) {
      yield state.copyWith(
					isAuthenticated: false,
        showErrorMessages: false,
          isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await forwardedCall(
          userName: state.userName, password: state.password);
    }
    yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
				isAuthenticated: failureOrSuccess != null && failureOrSuccess.isRight(),
        authFailureOrSuccessOption: optionOf(failureOrSuccess));
  }
}
