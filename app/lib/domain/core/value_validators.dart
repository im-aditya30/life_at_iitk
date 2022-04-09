import 'package:dartz/dartz.dart';

import 'failures.dart';

/// returns error message as left of ValueFailure.invalidUserName
Either<ValueFailure<String>,String> validateUserName(String input){
  const userNameRegex = r"^[a-zA-Z]+$";
  if(RegExp(userNameRegex).hasMatch(input)) return right(input);
  else if(input.isNotEmpty == true) return left(const ValueFailure.invalidUserName(failedValue: "This doesn't looks like an username"));
  else return left(const ValueFailure.invalidUserName(failedValue: "An Username is required"));
}

/// returns error message as left of ValueFailure.invalidPassword
Either<ValueFailure<String>,String> validatePassword(String input){
  if(input.length >= 6) return right(input);
  else if(input.isNotEmpty == true) return left(const ValueFailure.invalidPassword(failedValue: "Password should contains greater than 6 chars"));
  else return left(const  ValueFailure.invalidPassword(failedValue: "A Password is required"));
}

// /// returns error message as left of ValueFailure.invalidConfirmPassword
// Either<ValueFailure<String>,String> validateConfirmPassword(String input, String password){
//   if(input == password) return right(input);
//   else return left(ValueFailure.invalidConfirmPassword(failedValue: "This isn't the same password that you entered above"));
// }