import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:salahtrackerapp/features/home/presentation/screens/home_screen.dart';
import '../widgets/intro_screen_one.dart';
import '../widgets/intro_screen_three.dart';
import '../widgets/intro_screen_two.dart';

class IntroScreen extends StatefulWidget {
  static const path = '/intro';
  static const name = 'intro';
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  final _shape = [
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
    ),
    const RoundedRectangleBorder(),
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
  ];
  final _size = const Size(40.0, 10.0);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      pages: [
        introScreenOne(context, () {
          _introKey.currentState?.next();
        }),
        introScreenTwo(context, () {
          _introKey.currentState?.next();
        }),
        introScreenThree(context, () {
          context.go(HomeScreen.path);
        }),
      ],
      showNextButton: false,
      showDoneButton: false,
      controlsPosition: const Position(
        top: 50,
        left: 0,
        right: 0,
        bottom: 0,
      ),
      dotsDecorator: DotsDecorator(
        size: _size,
        activeSize: _size,
        activeColor: Colors.black,
        color: Colors.black26,
        spacing: const EdgeInsets.all(0),
        activeShapes: _shape,
        shapes: _shape,
      ),
    );
  }
}
