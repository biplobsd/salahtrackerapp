import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:salahtrackerapp/features/splash/presentation/widgets/logo.dart';

PageViewModel introScreenOne(BuildContext context, void Function()? onPressed) {
  return PageViewModel(
    title: '',
    bodyWidget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 200,
        ),
        const Logo(),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Welcome to Salah Tracker App',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          'Track, Reflect, and Elevate Your Spiritual Journey',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 60,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent)),
            icon: const Icon(
              Icons.keyboard_arrow_right,
              size: 40,
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    ),
  );
}
