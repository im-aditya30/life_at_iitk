import 'failures.dart';

class UnexpectedValueError extends Error {
	final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);


  @override
  String toString() {
		const explaination = "Encountered a ValueFailure at an uncovered point.";
		return Error.safeToString('$explaination Terminating... Failure was: $valueFailure');
	}
}

// class Failure{
// 	final String message;

//   Failure(this.message);
// }