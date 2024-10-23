import 'package:either_dart/either.dart';
import 'package:salahtrackerapp/core/error/failures.dart';
import 'package:salahtrackerapp/features/home/domain/entities/calendar_data.dart';

import '../repositories/calendar_data_repository.dart';

class CalendarDataUsecase {
  final CalendarDataRepository repository;

  CalendarDataUsecase(this.repository);

  Future<Either<Failure, CalendarData>> call(
      double latitude, double longitude, int method, int year, int month) {
    return repository.getData(latitude, longitude, method, year, month);
  }
}
