import 'package:go_router/go_router.dart';

import '../features/splash/presentation/screens/splash_page.dart';

final goRouter = GoRouter(
  initialLocation: SplashPage.path,
  routes: [
    GoRoute(
      name: SplashPage.name,
      path: SplashPage.path,
      builder: (context, state) => const SplashPage(),
    ),
  ],
);
