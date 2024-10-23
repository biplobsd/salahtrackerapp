import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salahtrackerapp/features/home/domain/usecases/calendar_data_usecase.dart';
import 'package:salahtrackerapp/features/home/presentation/providers/calendar_data_usecase_provider.dart';

import 'calendar_data_state.dart';

class CalendarDataNotifier extends StateNotifier<CalendarDataState> {
  final CalendarDataUsecase _calendarDataUsecase;

  CalendarDataNotifier(this._calendarDataUsecase)
      : super(const CalendarDataState());

  Future<void> getData(double latitude, double longitude, int method, int year,
      int month) async {
    state = state.copyWith(isLoading: true);

    try {
      final data =
          await _calendarDataUsecase(latitude, longitude, method, year, month);

      if (data.isRight && data.right.data != null) {
        state = state.copyWith(calendarData: data.right.data, isLoading: false);
      } else {
        state = state.copyWith(errorMessage: 'Server error', isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
    state = state.copyWith(isLoading: false);
  }
}

final calendarDataProvider =
    StateNotifierProvider<CalendarDataNotifier, CalendarDataState>((ref) {
  final calendarDataUsecase = ref.read(calendarDataUsecaseProvider);

  return CalendarDataNotifier(calendarDataUsecase);
});
