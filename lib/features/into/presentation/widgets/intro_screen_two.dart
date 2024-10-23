import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:salahtrackerapp/core/assets.dart';
import 'package:salahtrackerapp/features/authentication/presentation/providers/auth_provider.dart';

PageViewModel introScreenTwo(BuildContext context, void Function()? onPressed) {
  return PageViewModel(
    title: '',
    bodyWidget: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Assalamu Alaikum",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);
            return authState.when(
                initial: () => const SizedBox(),
                loading: () => const SizedBox(),
                authenticated: (user) => Text(
                      user.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                error: (_) => const SizedBox());
          },
        ),
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          Assets.prayWhite,
          fit: BoxFit.cover,
          width: 250,
        ),
        const SizedBox(
          height: 80,
        ),
        Text(
          'Track Your Prayers with Ease',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'To provide you with accurate prayer times and timely reminders, please allow the app to access your location and notifications',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w400,
              ),
          textAlign: TextAlign.center,
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
