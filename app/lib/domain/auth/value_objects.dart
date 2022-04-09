import 'package:dartz/dartz.dart';
import '../core/errors.dart';
import '../core/failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class UserName extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>,String> value;
  
  factory UserName(String input) {
    assert(input != null);
    return UserName._(validateUserName(input));
  }

	
	@override
  String getOrCrash() {
		return value.fold((l) => throw UnexpectedValueError(l), (r) => '$r@iitk.ac.in');
  }

  const UserName._(this.value);
}


class Password extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>,String> value;
  
  factory Password(String input) {
    assert(input != null);
    return Password._(validatePassword(input));
  }


  const Password._(this.value);
}


// class ConfirmPassword extends ValueObject<String>{
//   final Either<ValueFailure<String>,String> value;
//   final String password;
  
//   factory ConfirmPassword(String input,String password) {
//     assert(input != null);
//     return ConfirmPassword._(validateConfirmPassword(input, password),password);
//   }

//   const ConfirmPassword._(this.value, this.password,);
// }