import 'package:go_router/go_router.dart';
import 'package:salahtrackerapp/features/authentication/presentation/screens/login_screen.dart';
import 'package:salahtrackerapp/features/authentication/presentation/screens/registration_screen.dart';
import 'package:salahtrackerapp/features/home/presentation/screens/home_screen.dart';
import 'package:salahtrackerapp/features/into/presentation/screens/intro_screen.dart';
import 'package:salahtrackerapp/features/splash/presentation/screens/splash_screen.dart';

final goRouter = GoRouter(
  initialLocation: SplashScreen.path,
  routes: [
    GoRoute(
      name: SplashScreen.name,
      path: SplashScreen.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: LoginScreen.name,
      path: LoginScreen.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: RegistrationScreen.name,
      path: RegistrationScreen.path,
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      name: IntroScreen.name,
      path: IntroScreen.path,
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      name: HomeScreen.name,
      path: HomeScreen.path,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
