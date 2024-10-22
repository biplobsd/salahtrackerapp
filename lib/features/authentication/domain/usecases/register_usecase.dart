import 'package:either_dart/either.dart';
import 'package:salahtrackerapp/core/error/failures.dart';
import 'package:salahtrackerapp/features/authentication/domain/entities/user.dart';
import 'package:salahtrackerapp/features/authentication/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, User>> call(
      String email, String password, String name) {
    return repository.register(email, password, name);
  }
}
