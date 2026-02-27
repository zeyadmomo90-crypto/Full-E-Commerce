import 'package:dio/dio.dart';
import 'package:ppp/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'connectionTimeout');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: 'sendTimeout');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'receiveTimeout');
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: 'badCertificate');
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'cancel');
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'connectionError');
        case DioExceptionType.unknown:
          return ApiErrorModel(message: 'unknown');
      }
    } else {
      return ApiErrorModel(message: error.toString());
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  // لو السيرفر رجع List مباشرة
  if (data is List) {
    return ApiErrorModel(
      message: data.join('\n'),
      statusCode: 400,
      error: 'Bad Request',
    );
  }

  // لو السيرفر رجع Map
  if (data is Map<String, dynamic>) {
    final rawMessage = data['message'];

    return ApiErrorModel(
      message: rawMessage is List
          ? rawMessage.join('\n')
          : rawMessage?.toString() ??
                'Unknown error occurred. Please try again later.',
      statusCode: data['statusCode'],
      error: data['error']?.toString(),
    );
  }

  // أي شكل غير متوقع
  return ApiErrorModel(
    message: 'Unexpected error format',
    statusCode: 500,
    error: 'Unknown',
  );
}
