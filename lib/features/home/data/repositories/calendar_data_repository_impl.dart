import 'package:either_dart/either.dart';
import 'package:salahtrackerapp/core/error/failures.dart';
import 'package:salahtrackerapp/features/home/domain/entities/calendar_data.dart';
import 'package:salahtrackerapp/features/home/domain/repositories/calendar_data_repository.dart';

import '../datasources/calendar_data_datasource.dart';

class CalendarDataRepositoryImpl implements CalendarDataRepository {
  final CalendarDataDatasource dataSource;

  CalendarDataRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CalendarData>> getData(double latitude,
      double longitude, int method, int year, int month) async {
    try {
      final data =
          await dataSource.getData(latitude, longitude, method, year, month);
      if (data.data != null) {
        return Right(data);
      } else {
        return Left(ServerFailure());
      }
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }
}
