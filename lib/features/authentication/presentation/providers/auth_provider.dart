import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salahtrackerapp/features/authentication/domain/usecases/register_usecase.dart';
import 'package:salahtrackerapp/features/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:salahtrackerapp/features/authentication/domain/usecases/sign_out_usecase.dart';
import 'package:salahtrackerapp/features/authentication/presentation/providers/auth_di.dart';
import 'package:salahtrackerapp/features/authentication/presentation/providers/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInUseCase _signInUseCase;
  final SignOutUsecase _signOutUseCase;
  final RegisterUseCase _registerUseCase;

  AuthNotifier(
    this._signInUseCase,
    this._registerUseCase,
    this._signOutUseCase,
  ) : super(const AuthState.initial());

  Future<void> signIn(String email, String password) async {
    state = const AuthState.loading();
    final result = await _signInUseCase(email, password);
    state = result.fold(
      (failure) => const AuthState.error("Login Failed"),
      (user) => AuthState.authenticated(user),
    );
  }

  Future<void> register(String email, String password, String name) async {
    state = const AuthState.loading();
    final result = await _registerUseCase(email, password, name);
    state = result.fold(
      (failure) => const AuthState.error("Registration Failed"),
      (user) => AuthState.authenticated(user),
    );
  }

  Future<void> signOut() async {
    try {
      await _signOutUseCase();
      state = const AuthState
          .initial(); // Update state to initial or handle as needed
    } catch (e) {
      state = AuthState.error("Sign out failed: ${e.toString()}");
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final signInUseCase = ref.read(signInUseCaseProvider);
  final signOutUseCase = ref.read(signOutUseCaseProvider);
  final registerUseCase = ref.read(registerUseCaseProvider);

  return AuthNotifier(
    signInUseCase,
    registerUseCase,
    signOutUseCase,
  );
});
