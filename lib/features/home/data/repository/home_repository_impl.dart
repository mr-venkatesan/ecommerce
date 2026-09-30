import 'package:ecommerce/features/home/data/endpoint/home_endpoint.dart';
import 'package:ecommerce/features/home/data/model/product_model.dart';
import 'package:ecommerce/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce/features/home/domain/repository/home_repository.dart';
import 'package:ecommerce/shared/models/api_response.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeEndpoint _homeEndpoint;

  HomeRepositoryImpl(this._homeEndpoint);

  Future<ApiResponse<List<ProductEntity>>> getProductList() async {
    final response = await _homeEndpoint.getProductList();

    return ApiResponse<List<ProductEntity>>.fromJson(
      response.data as Map<String, dynamic>,
          (data) => (data as List)
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList(),
    );
  }
}
