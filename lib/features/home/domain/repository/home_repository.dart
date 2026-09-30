import 'package:ecommerce/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce/shared/models/api_response.dart';

abstract class HomeRepository {
  Future<ApiResponse<List<ProductEntity>>> getProductList();
}