import 'package:dio/dio.dart';
import 'package:ecommerce/shared/constants/dio_error_messages.dart';

class DioErrorHandler {
  DioErrorHandler._();

  static String handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DioErrorMessages.connectionTimeout;

      case DioExceptionType.sendTimeout:
        return DioErrorMessages.sendTimeout;

      case DioExceptionType.receiveTimeout:
        return DioErrorMessages.receiveTimeout;

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response);

      case DioExceptionType.cancel:
        return DioErrorMessages.cancel;

      case DioExceptionType.connectionError:
        return DioErrorMessages.connectionError;

      case DioExceptionType.badCertificate:
        return DioErrorMessages.badCertificate;

      case DioExceptionType.transformTimeout:
        return DioErrorMessages.transformTimeout;

      case DioExceptionType.unknown:
        return DioErrorMessages.unknown;
    }
  }

  static String _handleStatusCode(Response<dynamic>? response) {
    switch (response?.statusCode) {
      case 400:
        return DioErrorMessages.badRequest;
      case 401:
        return DioErrorMessages.unauthorized;
      case 403:
        return DioErrorMessages.forbidden;
      case 404:
        return DioErrorMessages.notFound;
      case 408:
        return DioErrorMessages.requestTimeout;
      case 422:
        return DioErrorMessages.validationFailed;
      case 429:
        return DioErrorMessages.tooManyRequests;
      case 500:
        return DioErrorMessages.internalServerError;
      case 502:
        return DioErrorMessages.badGateway;
      case 503:
        return DioErrorMessages.serviceUnavailable;
      case 504:
        return DioErrorMessages.gatewayTimeout;
      default:
        return DioErrorMessages.unexpectedServerError;
    }
  }
}
