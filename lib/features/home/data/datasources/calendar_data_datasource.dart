import 'package:dio/dio.dart';
import 'package:salahtrackerapp/features/home/domain/entities/calendar_data.dart';

const String baseUrl = 'https://api.aladhan.com/v1/calendar';

class CalendarDataDatasource {
  final Dio _dio;
  CalendarDataDatasource({required Dio dio}) : _dio = dio;

  Future<CalendarData> getData(double latitude, double longitude, int method,
      int year, int month) async {
    Map<String, dynamic> queryParams = {
      'latitude': latitude,
      'longitude': longitude,
      'method': method
    };

    try {
      Response response =
          await _dio.get('$baseUrl/$year/$month', queryParameters: queryParams);

      if (response.statusCode == 200) {
        return CalendarData.fromJson(response.data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
