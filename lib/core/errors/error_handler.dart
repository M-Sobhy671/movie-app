import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handle(error) {
    if (error is DioException) {
      return Failure(error.message ?? "Network Error");
    }
    return Failure("Unexpected Error");
  }
}