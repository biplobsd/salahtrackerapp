import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:salahtrackerapp/core/assets.dart';

PageViewModel introScreenThree(
    BuildContext context, void Function()? onPressed) {
  return PageViewModel(
    title: '',
    bodyWidget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Image.asset(
          Assets.spiritualWhite,
          fit: BoxFit.cover,
          width: 250,
        ),
        const SizedBox(
          height: 80,
        ),
        Text(
          'Enhance Your Spiritual Practice',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Also helps you incorporate tasbih and other daily Islamic rituals into your routine.',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w400,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 60,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            child: const Text(
              "Get Started",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}
