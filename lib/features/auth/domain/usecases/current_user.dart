import 'package:blog_app/core/errors/failures.dart';
import 'package:blog_app/core/usecases/usecase.dart';
import 'package:blog_app/core/common/entities/profile.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<Profile, NoParams> {
  final AuthRepository authRepository;
  const CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, Profile>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
