import 'package:flutter/material.dart';
import 'package:salahtrackerapp/core/assets.dart';

class SplashPage extends StatefulWidget {
  static const path = '/splash';
  static const name = 'splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.logoWhite),
      ),
    );
  }
}
