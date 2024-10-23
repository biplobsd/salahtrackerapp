import 'package:flutter/material.dart';
import 'package:salahtrackerapp/core/assets.dart';

class Menus extends StatelessWidget {
  Menus({
    super.key,
  });

  final menus = [
    ['Al-Quran', Assets.alQuran],
    ['Hadith', Assets.hadith],
    ['Dua', Assets.dua],
    ['Tasbih', Assets.tasbih],
    ['Qibla', Assets.qibla],
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: menus
          .map(
            (e) => Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      e[1],
                      width: 30,
                      color: Colors.white,
                    )),
                Text(
                  e[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
          .toList(),
    );
  }
}
