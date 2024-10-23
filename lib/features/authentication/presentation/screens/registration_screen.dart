import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:salahtrackerapp/features/authentication/presentation/providers/auth_provider.dart';
import 'package:salahtrackerapp/features/authentication/presentation/widgets/register_form.dart';
import 'package:salahtrackerapp/features/into/presentation/screens/intro_screen.dart';

class RegistrationScreen extends ConsumerWidget {
  static const path = '/registration';
  static const name = 'registration';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: authState.when(
          initial: () => const RegisterForm(),
          loading: () => const Center(child: CircularProgressIndicator()),
          authenticated: (user) {
            Future.microtask(() {
              context.go(IntroScreen.path);
            });
            return Center(child: Text('Welcome, ${user.email}!'));
          },
          error: (message) {
            Future.microtask(() {
              final authState = ref.read(authProvider.notifier);
              authState.signOut();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
            });
            return const RegisterForm();
          },
        ),
      ),
    );
  }
}
