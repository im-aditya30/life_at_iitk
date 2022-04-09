import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_at_iitk/domain/core/errors.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> {

  const ValueObject();

  Either<ValueFailure<T>,T> get value;
	// id = identity 😍
	/// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() => value.fold((l) => throw UnexpectedValueError(l), (r) => r);

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
  
  @override
  String toString() => 'Value($value)';
}

