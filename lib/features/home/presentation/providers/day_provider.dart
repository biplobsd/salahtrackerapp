import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:salahtrackerapp/features/home/domain/entities/calendar_data.dart';

part 'day_provider.g.dart';

@riverpod
class Day extends _$Day {
  @override
  Datum? build() {
    return null;
  }

  void change(Datum datum) {
    state = datum;
  }
}
