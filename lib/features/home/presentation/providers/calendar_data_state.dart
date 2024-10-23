import 'package:equatable/equatable.dart';
import 'package:salahtrackerapp/features/home/domain/entities/calendar_data.dart';

class CalendarDataState extends Equatable {
  final bool isLoading;
  final List<Datum>? calendarData;
  final String? errorMessage;

  const CalendarDataState({
    this.isLoading = false,
    this.calendarData,
    this.errorMessage,
  });

  CalendarDataState copyWith({
    bool? isLoading,
    List<Datum>? calendarData,
    String? errorMessage,
  }) {
    return CalendarDataState(
      isLoading: isLoading ?? this.isLoading,
      calendarData: calendarData ?? this.calendarData,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, calendarData, errorMessage];
}
