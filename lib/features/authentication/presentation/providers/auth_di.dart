import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salahtrackerapp/features/authentication/data/datasources/firebase_auth_datasource.dart';
import 'package:salahtrackerapp/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:salahtrackerapp/features/authentication/domain/repositories/auth_repository.dart';
import 'package:salahtrackerapp/features/authentication/domain/usecases/register_usecase.dart';
import 'package:salahtrackerapp/features/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:salahtrackerapp/features/authentication/domain/usecases/sign_out_usecase.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseAuthDataSourceProvider = Provider<FirebaseAuthDataSource>((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider);
  return FirebaseAuthDataSource(firebaseAuth);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.read(firebaseAuthDataSourceProvider);
  return AuthRepositoryImpl(dataSource);
});

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SignInUseCase(repository);
});

final signOutUseCaseProvider = Provider<SignOutUsecase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SignOutUsecase(repository);
});

final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return RegisterUseCase(repository);
});
