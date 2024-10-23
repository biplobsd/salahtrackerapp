import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salahtrackerapp/features/home/data/datasources/calendar_data_datasource.dart';
import 'package:salahtrackerapp/features/home/data/repositories/calendar_data_repository_impl.dart';
import 'package:salahtrackerapp/features/home/domain/usecases/calendar_data_usecase.dart';

final calendarDataDatasourceProvider = Provider(
  (ref) => CalendarDataDatasource(
    dio: Dio(),
  ),
);

final calendarDataRepositoryImplProvider = Provider(
  (ref) => CalendarDataRepositoryImpl(
    ref.read(calendarDataDatasourceProvider),
  ),
);

final calendarDataUsecaseProvider = Provider(
  (ref) => CalendarDataUsecase(
    ref.read(calendarDataRepositoryImplProvider),
  ),
);
