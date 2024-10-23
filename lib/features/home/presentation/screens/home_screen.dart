import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:salahtrackerapp/features/authentication/presentation/providers/auth_provider.dart';
import 'package:salahtrackerapp/features/authentication/presentation/screens/login_screen.dart';
import 'package:salahtrackerapp/features/splash/presentation/widgets/logo.dart';

import '../widgets/calendar_status_hero.dart';
import '../widgets/mark_as_done_pray.dart';
import '../widgets/menus.dart';
import '../widgets/quotes.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const path = '/home';
  static const name = 'home';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  DateTime selectedDate = DateTime.now();

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Logo(),
        title: authState.when(
          initial: () => TextButton(
              onPressed: () {
                context.go(LoginScreen.path);
              },
              child: const Text('Login')),
          loading: () => const Center(child: CircularProgressIndicator()),
          authenticated: (user) {
            return Center(child: Text('Welcome, ${user.name}'));
          },
          error: (message) => Center(child: Text(message)),
        ),
        actions: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: ResponsiveNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChange: changeTab,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        activeButtonFlexFactor: 50,
        showActiveButtonText: false,
        backgroundColor: Colors.black,
        backgroundOpacity: .85,
        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
            text: 'Home',
            icon: Icons.home,
          ),
          NavigationBarButton(
            text: 'Timer',
            icon: Icons.timer,
          ),
          NavigationBarButton(
            text: 'Books',
            icon: Icons.menu_book,
          ),
          NavigationBarButton(
            text: 'Settings',
            icon: Icons.settings,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CalendarStatusHero(),
              const SizedBox(height: 15),
              const Divider(height: 1),
              const SizedBox(height: 15),
              const MarkAsDonePray(),
              const SizedBox(height: 20),
              Menus(),
              const SizedBox(height: 20),
              const SizedBox(
                height: 360,
                child: Quotes(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
