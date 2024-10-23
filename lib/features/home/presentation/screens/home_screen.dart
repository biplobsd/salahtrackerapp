import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:salahtrackerapp/core/assets.dart';
import 'package:salahtrackerapp/features/splash/presentation/widgets/logo.dart';

import '../widgets/calendar_status_hero.dart';
import '../widgets/mark_as_done_pray.dart';
import '../widgets/menus.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const path = '/home';
  static const name = 'home';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  DateTime selectedDate = DateTime.now(); // Use current date and time

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Logo(),
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
            ],
          ),
        ),
      ),
    );
  }
}
