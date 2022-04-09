import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'auth_failure.dart';
import 'auth_map.dart';
import 'user.dart';
import 'value_objects.dart';

// Firebase Auth

abstract class AuthInterface {
  Future<Either<AuthFailure, Unit>> registerWithUserNameAndPassword({
    required UserName userName,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithUserNameAndPassword({
    required UserName userName,
    required Password password,
  });
	Option<User> getCurrentUser();

	Future<Either<AuthFailure, Unit>> sendVerificationEmail();
	Future<Either<AuthFailure, Unit>> resetPassword({
    required UserName userName,
  });
	Future<void> signOut();
}