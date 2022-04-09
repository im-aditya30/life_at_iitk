import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_at_iitk/domain/core/errors.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String uid,
    required String id,
    required bool isEmailVerified,
  }) = _User;

  factory User.fromFirebaseUser(firebase.User? user) => User(
      id: user?.email?.replaceAll('@iitk.ac.in', '') ?? "",
      isEmailVerified: user?.emailVerified ?? false,
      uid: user?.uid??"");
}

extension UserX<T extends User> on Option<T> {
  User get getOrCrash {
    return getOrElse(() => throw UnexpectedValueError('User is not loggedin'));
  }
}

class UnexpectedValueError extends Error {
  final String valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explaination = "Encountered a ValueFailure at an uncovered point.";
    return Error.safeToString(
        '$explaination Terminating... Failure was: $valueFailure');
  }
}
