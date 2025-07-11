import 'package:blog_app/core/errors/failures.dart';
import 'package:blog_app/core/common/entities/profile.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Profile>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, Profile>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Profile>> currentUser();
}
