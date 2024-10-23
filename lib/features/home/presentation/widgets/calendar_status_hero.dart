import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:salahtrackerapp/core/constants.dart';
import 'package:salahtrackerapp/features/home/presentation/providers/calendar_data_notifier.dart';

class CalendarStatusHero extends ConsumerStatefulWidget {
  const CalendarStatusHero({super.key});

  @override
  ConsumerState<CalendarStatusHero> createState() => _CalendarStatusHeroState();
}

class _CalendarStatusHeroState extends ConsumerState<CalendarStatusHero> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      ref.read(calendarDataProvider.notifier).getData(
            latitude,
            longitude,
            method,
            selectedDate.year,
            selectedDate.month,
          );
    }
  }

  String convertTo12HourFormat(String time24) {
    final dateTime = DateFormat("HH:mm").parse(time24);
    return DateFormat("hh:mm a").format(dateTime);
  }

  Duration timeDifference(String prayerTime) {
    final now = DateTime.now();
    var prayer = DateFormat("HH:mm").parse(prayerTime.split(' ')[0]);
    prayer = DateTime(now.year, now.month, now.day, prayer.hour, prayer.minute);
    if (prayer.isBefore(now)) {
      prayer = prayer.add(const Duration(days: 1));
    }
    return prayer.difference(now);
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(calendarDataProvider.notifier).getData(
            latitude,
            longitude,
            method,
            selectedDate.year,
            selectedDate.month,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final calendarData = ref.watch(calendarDataProvider);

    if (calendarData.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (calendarData.errorMessage != null) {
      return Center(child: Text("Server error: ${calendarData.errorMessage}"));
    }

    if (calendarData.calendarData == null) {
      return const Center(child: Text("No data"));
    }

    final datum = calendarData.calendarData![selectedDate.day - 1];
    final timings = datum.timings!;
    final gregorian = datum.date!.gregorian!;
    final hijri = datum.date!.hijri!;
    final suhurTime12 = convertTo12HourFormat(timings.imsak!.split(' ')[0]);
    final iftarTime12 = convertTo12HourFormat(timings.maghrib!.split(' ')[0]);

    final prayerTimes = {
      "Fajr": timings.fajr!,
      "Dhuhr": timings.dhuhr!,
      "Asr": timings.asr!,
      "Maghrib": timings.maghrib!,
      "Isha": timings.isha!,
    };

    String nextPrayer = '';
    Duration shortestDuration = const Duration(days: 1);
    prayerTimes.forEach((prayer, time) {
      final difference = timeDifference(time);
      if (!difference.isNegative && difference < shortestDuration) {
        shortestDuration = difference;
        nextPrayer = prayer;
      }
    });

    String untilNextPrayer =
        "${shortestDuration.inHours}h ${shortestDuration.inMinutes % 60}m until $nextPrayer";

    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nextPrayer,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    untilNextPrayer,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                Text('Suhur: $suhurTime12',
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text('Iftar: $iftarTime12',
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      gregorian.weekday!.en!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () => _selectDate(context),
                            child: const Icon(
                              Icons.edit,
                              size: 10,
                            )),
                        Text(
                          '(${gregorian.date})',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "${hijri.month!.en} ${hijri.day}, ${hijri.year} AH",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                if (hijri.holidays!.isNotEmpty)
                  Text(
                    hijri.holidays!.join(", "),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                const SizedBox(height: 8),
                Text(
                  "Dhaka, Bangladesh",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
