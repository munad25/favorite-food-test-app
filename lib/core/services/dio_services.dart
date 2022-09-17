import 'package:dio/dio.dart';

Dio dioServices() {
  final dio = Dio();
  dio.options.baseUrl = 'https://www.themealdb.com/api';
  return dio;
}