import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:salahtrackerapp/features/authentication/presentation/providers/auth_provider.dart';
import 'package:salahtrackerapp/features/authentication/presentation/providers/auth_user_provider.dart';
import 'package:salahtrackerapp/features/authentication/presentation/widgets/login_form.dart';

class LoginScreen extends ConsumerWidget {
  static const path = '/login';
  static const name = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: authState.when(
          initial: () => const LoginForm(),
          loading: () => const Center(child: CircularProgressIndicator()),
          authenticated: (user) {
            ref.read(authUserProvider.notifier).addUser(user);
            Future.microtask(() {
              context.go('/');
            });
            return Center(child: Text('Welcome, ${user.email}!'));
          },
          error: (message) => Center(child: Text(message)),
        ),
      ),
    );
  }
}
