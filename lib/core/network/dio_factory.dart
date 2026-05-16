import 'package:dio/dio.dart';

class DioFactory {
  static Dio getDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://movies-api.accel.li/api/v2/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      error: true,
    ));

    return dio;
  }
}