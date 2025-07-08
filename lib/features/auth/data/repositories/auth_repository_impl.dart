import 'package:blog_app/core/errors/exceptions.dart';
import 'package:blog_app/core/errors/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/entities/profile.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, Profile>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getProfile(
      () async => await authRemoteDataSource.signUpWithEmailAndPassword(
        name,
        email,
        password,
      ),
    );
  }

  @override
  Future<Either<Failure, Profile>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _getProfile(
      () async =>
          await authRemoteDataSource.loginWithEmailAndPassword(email, password),
    );
  }

  Future<Either<Failure, Profile>> _getProfile(
    Future<Profile> Function() getUserFunction,
  ) async {
    try {
      final user = await getUserFunction();
      return right(user);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
