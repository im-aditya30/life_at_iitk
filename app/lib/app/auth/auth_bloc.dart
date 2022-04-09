import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/auth/auth_interface.dart';
import '../../domain/auth/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthInterface _authInterface;
	// final FirebaseMessaging _fcm;
  AuthBloc(this._authInterface) : super(const AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
        authCheckRequested: (e) async* {
					// NotificationSettings settings = await _fcm.requestPermission(
					// 	alert: true,
					// 	announcement: false,
					// 	badge: true,
					// 	carPlay: false,
					// 	criticalAlert: false,
					// 	provisional: false,
					// 	sound: true,
					// );
					// await _fcm.setForegroundNotificationPresentationOptions(
					// 	alert: true, // Required to display a heads up notification
					// 	badge: true,
					// 	sound: true,
					// );
          final userOption = _authInterface.getCurrentUser();
          yield userOption.fold(() => const AuthState.unAuthenticated(),
              (user) => AuthState.authenticated(user: user));
        },
        signedOut: (e) async* {
					await _authInterface.signOut();
					log("loggedout");
					yield const AuthState.unAuthenticated();
				}
		);
  }
}
