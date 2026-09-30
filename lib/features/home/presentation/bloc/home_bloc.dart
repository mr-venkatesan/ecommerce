import 'package:ecommerce/features/home/domain/usecase/home_usecase.dart';
import 'package:ecommerce/shared/models/api_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/home/domain/entity/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase _homeUseCase;

  HomeBloc(this._homeUseCase) : super(const HomeState.initial()) {
    on<_GetProductList>((event, emit) async {
      emit(const HomeState.loading());
      try {
        final productList = await _homeUseCase.getProductList();
        emit(HomeState.success(productList));
      } catch (e) {
        emit(HomeState.failure(e.toString()));
      }
    });
  }
}
