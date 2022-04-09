
import 'package:freezed_annotation/freezed_annotation.dart';
import '../api/api_failure.dart';
import '../database/database_failure.dart';
part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidUserName({
    required String failedValue,
  }) = InvalidUserName<T>;
  const factory ValueFailure.invalidPassword({
    required String failedValue,
  }) = InvalidPassword<T>;
  // const factory ValueFailure.invalidConfirmPassword({
  //   required String failedValue,
  // }) = InvalidConfirmPassword<T>;
}


@freezed
abstract class Failure<T> with _$Failure<T>{
	const factory Failure.apiFailure(ApiFailure apiFailure) = _APIFailure;
	const factory Failure.dbFailure(DBFailure dbFailure) = _DBFailure;
}