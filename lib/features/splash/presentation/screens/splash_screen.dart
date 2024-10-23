import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salahtrackerapp/features/home/presentation/screens/home_screen.dart';
import 'package:salahtrackerapp/features/splash/presentation/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  static const path = '/splash';
  static const name = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      context.go(HomeScreen.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Logo(),
    );
  }
}
