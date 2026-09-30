import 'package:dio/dio.dart';
import 'package:ecommerce/core/config/app_api_config.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppApiConfig().baseUrl,
      receiveTimeout: Duration(seconds: 30),
      connectTimeout: Duration(seconds: 30),
      headers: {"Accept": "application/json"},
    ),
  );
}
