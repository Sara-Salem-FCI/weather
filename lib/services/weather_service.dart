import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '3a399ab5f3e84c78afb224226241502';

  Future<WeatherModel> getForecast({required String cityName}) async {
    try {
      final Response<Map<String, dynamic>> response = (await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1')) ;
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops, There was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, There was an error');
    }
  }
}
