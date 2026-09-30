import 'package:ecommerce/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce/features/home/domain/repository/home_repository.dart';
import 'package:ecommerce/shared/models/api_response.dart';

class HomeUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  Future<ApiResponse<List<ProductEntity>>> getProductList() {
    return _homeRepository.getProductList();
  }

}
