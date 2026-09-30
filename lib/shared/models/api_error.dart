class ApiError {
  final String code;
  final String? details;

  const ApiError({
    required this.code,
    this.details,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      code: json['code'] ?? '',
      details: json['details']?.toString(),
    );
  }
}