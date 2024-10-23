import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  List<Map<String, String>> quotes = [
    {
      'person': 'Amr b. Dinar',
      'source': 'Sahih Bukhari, 1595',
      'quote':
          '"I heard Ibn Umar say: \'The Prophet (ﷺ) said, "The Muslim is the brother of another Muslim. He should neither oppress him nor should he hand him over to an oppressor. Whoever fulfills the needs of his brother, Allah will fulfill his needs; whoever removes the trouble of a Muslim, Allah will remove one of his troubles on the Day of Resurrection, and whoever covers (the faults of) a Muslim, Allah will cover his faults on the Day of Resurrection."\'"'
    },
    {
      'person': 'Abu Huraira',
      'source': 'Sahih Muslim, 2699 a',
      'quote':
          '"The Messenger of Allah (ﷺ) said, \'Do not envy one another, do not inflate prices to one another, do not hate one another, do not turn away from one another, and do not undercut one another in trade, but rather be servants of Allah and brothers. A Muslim is the brother of another Muslim. He does not oppress him, humiliate him, or look down upon him. Righteousness is here,\' and he pointed to his chest three times."'
    }
  ];

  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      controlsPosition: const Position(left: 0, right: 0, bottom: 20),
      showSkipButton: false,
      controlsPadding: EdgeInsets.zero,
      controlsMargin: EdgeInsets.zero,
      globalHeader: null,
      dotsDecorator: const DotsDecorator(
          activeColor: Colors.black87, color: Colors.black38),
      pages: quotes
          .map((q) => PageViewModel(
              decoration: const PageDecoration(
                contentMargin: EdgeInsets.symmetric(horizontal: 8),
                pageMargin: EdgeInsets.zero,
                footerPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                bodyAlignment: Alignment.topLeft,
              ),
              titleWidget: const SizedBox(
                height: 0,
              ),
              useScrollView: false,
              bodyWidget: Container(
                height: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      q['person']!,
                      textAlign: TextAlign.start,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                              ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      q['quote']!,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      q['source']!,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              )))
          .toList(),
      showNextButton: false,
      showDoneButton: false,
    );
  }
}
