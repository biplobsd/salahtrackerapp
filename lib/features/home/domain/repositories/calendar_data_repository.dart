import 'package:either_dart/either.dart';
import 'package:salahtrackerapp/core/error/failures.dart';
import 'package:salahtrackerapp/features/home/domain/entities/calendar_data.dart';

abstract class CalendarDataRepository {
  Future<Either<Failure, CalendarData>> getData(
      double latitude, double longitude, int method, int year, int month);
}
