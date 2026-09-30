import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_client.dart';
import 'package:ecommerce/core/error/dio_error_handler.dart';

class HomeEndpoint {
  final Dio dio;

  HomeEndpoint({Dio? dio}) : dio = dio ?? ApiClient.dio;

  Future<Response> getProductList() async{
    try {
      final response = await dio.get('/products');
      return response.data;
    } on DioException catch (error) {
      throw Exception(DioErrorHandler.handle(error));
    }
  }

}
