import 'package:flutter/material.dart';
import 'package:salahtrackerapp/core/assets.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(Assets.logoWhite),
    );
  }
}
