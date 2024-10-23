import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salahtrackerapp/core/assets.dart';
import 'package:salahtrackerapp/core/utils.dart';
import 'package:salahtrackerapp/features/home/domain/entities/calendar_data.dart';
import 'package:salahtrackerapp/features/home/presentation/providers/day_provider.dart';

class MarkAsDonePray extends ConsumerStatefulWidget {
  const MarkAsDonePray({super.key});

  @override
  ConsumerState<MarkAsDonePray> createState() => _MarkAsDonePrayState();
}

class _MarkAsDonePrayState extends ConsumerState<MarkAsDonePray> {
  List<bool> isPrayerDone = List.filled(5, false);
  int activePrayerIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dayProvider.notifier).listenSelf(updateCurrentPrayer);
    });
  }

  void updateCurrentPrayer(Datum? _, Datum? newDay) {
    if (newDay == null) return;

    final prayerTimes = {
      "Fajr": newDay.timings!.fajr!,
      "Dhuhr": newDay.timings!.dhuhr!,
      "Asr": newDay.timings!.asr!,
      "Maghrib": newDay.timings!.maghrib!,
      "Isha": newDay.timings!.isha!,
    };

    final currentPrayName = getCurrentPrayer(prayerTimes);
    final index = prayerTimes.keys.toList().indexOf(currentPrayName);

    setState(() {
      activePrayerIndex = index == -1 ? 0 : index;
      isPrayerDone = List.filled(5, false);
    });
  }

  void togglePrayerDone(int index) {
    setState(() {
      isPrayerDone[index] = !isPrayerDone[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final dayData = ref.watch(dayProvider);

    if (dayData == null) {
      return const Center(child: Text("No data yet! Please wait ..."));
    }

    final prayers = [
      {
        'name': 'Fajr',
        'img': Assets.fajr,
        'time': convertTo12HourFormat(dayData.timings!.fajr!)
      },
      {
        'name': 'Dhuhr',
        'img': Assets.dhuhr,
        'time': convertTo12HourFormat(dayData.timings!.dhuhr!)
      },
      {
        'name': 'Asr',
        'img': Assets.asr,
        'time': convertTo12HourFormat(dayData.timings!.asr!)
      },
      {
        'name': 'Maghrib',
        'img': Assets.maghrib,
        'time': convertTo12HourFormat(dayData.timings!.maghrib!)
      },
      {
        'name': 'Isha',
        'img': Assets.isha,
        'time': convertTo12HourFormat(dayData.timings!.isha!)
      },
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: prayers.asMap().entries.map((entry) {
            final index = entry.key;
            final prayer = entry.value;
            final isActive = index == activePrayerIndex;
            final isDone = isPrayerDone[index];

            return GestureDetector(
              onTap: () => setState(() {
                activePrayerIndex = index;
              }),
              child: Column(
                children: [
                  Text(
                    prayer['name']!,
                    style: TextStyle(
                      fontSize: 18,
                      color: isDone
                          ? Colors.grey
                          : isActive
                              ? Colors.blue
                              : Colors.black,
                    ),
                  ),
                  Text(
                    prayer['time']!,
                    style: TextStyle(
                      color: isDone
                          ? Colors.grey
                          : isActive
                              ? Colors.blue
                              : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                image: AssetImage(prayers[activePrayerIndex]['img']!),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Do you pray",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      prayers[activePrayerIndex]['name']!,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => togglePrayerDone(activePrayerIndex),
                      icon: const Icon(
                        Icons.highlight_remove_sharp,
                        color: Colors.redAccent,
                      ),
                    ),
                    IconButton(
                      onPressed: () => togglePrayerDone(activePrayerIndex),
                      icon: const Icon(
                        Icons.check_circle_outline_sharp,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
