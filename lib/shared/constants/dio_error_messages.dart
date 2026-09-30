class DioErrorMessages {
  DioErrorMessages._();

  static const connectionTimeout = 'Connection timeout. Please try again.';

  static const sendTimeout = 'Request timeout. Please try again.';

  static const receiveTimeout = 'Server took too long to respond.';

  static const connectionError =
      'No internet connection. Please check your network.';

  static const cancel = 'Request was cancelled.';

  static const badCertificate = 'Invalid server certificate.';

  static const unknown = 'Something went wrong. Please try again.';

  static const badRequest = 'Bad request.';
  static const unauthorized = 'Unauthorized. Please log in again.';
  static const forbidden = 'Access denied.';
  static const notFound = 'Resource not found.';
  static const requestTimeout = 'Request timeout.';
  static const validationFailed = 'Validation failed.';

  static const tooManyRequests = 'Too many requests. Please try again later.';

  static const internalServerError = 'Internal server error.';
  static const badGateway = 'Bad gateway.';

  static const serviceUnavailable = 'Service temporarily unavailable.';

  static const gatewayTimeout = 'Gateway timeout.';

  static const transformTimeout =
      'Data transformation timeout. Please try again.';

  static const unexpectedServerError = 'An unexpected server error occurred.';
}
