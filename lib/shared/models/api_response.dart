import 'package:ecommerce/shared/models/api_error.dart';

class ApiResponse<T> {
  final bool success;
  final int statusCode;
  final String message;
  final T? data;
  final ApiError? error;

  const ApiResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
    this.error,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic json)? fromJsonT,
      ) {
    final rawData = json['data'];

    return ApiResponse<T>(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: rawData == null
          ? null
          : fromJsonT != null
          ? fromJsonT(rawData)
          : rawData as T,
      error: json['error'] == null
          ? null
          : ApiError.fromJson(json['error']),
    );
  }
}