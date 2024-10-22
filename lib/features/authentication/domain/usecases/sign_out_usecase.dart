import 'package:either_dart/either.dart';
import 'package:salahtrackerapp/core/error/failures.dart';
import 'package:salahtrackerapp/features/authentication/domain/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository repository;

  SignOutUsecase(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.signOut();
  }
}
