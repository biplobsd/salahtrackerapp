import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:salahtrackerapp/features/authentication/domain/entities/user.dart';

part 'auth_user_provider.g.dart';

@riverpod
class AuthUser extends _$AuthUser {
  @override
  User? build() => null;

  void addUser(User user) {
    state = user;
  }

  void removeUser() {
    state = null;
  }
}
