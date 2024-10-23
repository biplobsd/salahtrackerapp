import 'package:intl/intl.dart';

String convertTo12HourFormat(String time24) {
  final dateTime = DateFormat("HH:mm").parse(time24.split(' ')[0]);
  return DateFormat("hh:mm a").format(dateTime);
}

String getCurrentPrayer(Map<String, String> prayerTimes) {
  final now = DateTime.now();

  final prayerDateTimes = prayerTimes.map((prayer, time) {
    var prayerDateTime = DateFormat("HH:mm").parse(time.split(' ')[0]);
    prayerDateTime = DateTime(now.year, now.month, now.day, prayerDateTime.hour,
        prayerDateTime.minute);
    return MapEntry(prayer, prayerDateTime);
  });

  final sortedPrayers = prayerDateTimes.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value));

  for (int i = 0; i < sortedPrayers.length; i++) {
    final currentPrayer = sortedPrayers[i];
    final nextPrayer =
        i < sortedPrayers.length - 1 ? sortedPrayers[i + 1] : sortedPrayers[0];

    if (now.isAfter(currentPrayer.value) && now.isBefore(nextPrayer.value)) {
      return currentPrayer.key;
    }
  }

  if (now.isAfter(sortedPrayers.last.value)) {
    return sortedPrayers.last.key;
  }

  return sortedPrayers.last.key;
}
