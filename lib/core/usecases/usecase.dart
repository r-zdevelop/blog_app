import 'package:blog_app/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {
  // This class can be used to pass no parameters to the use case.
  // It is useful for cases where the use case does not require any input.
}
