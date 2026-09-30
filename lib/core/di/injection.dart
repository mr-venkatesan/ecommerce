import 'package:ecommerce/features/home/data/endpoint/home_endpoint.dart';
import 'package:ecommerce/features/home/data/repository/home_repository_impl.dart';
import 'package:ecommerce/features/home/domain/repository/home_repository.dart';
import 'package:ecommerce/features/home/domain/usecase/home_usecase.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';



final getIt = GetIt.instance;

void setupDependencies() {
  // Endpoint
  getIt.registerLazySingleton<HomeEndpoint>(
        () => HomeEndpoint(),
  );

  // Repository
  getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(getIt<HomeEndpoint>()),
  );

  // UseCase
  getIt.registerLazySingleton<HomeUseCase>(
        () => HomeUseCase(getIt<HomeRepository>()),
  );

  // Bloc
  getIt.registerFactory<HomeBloc>(
        () => HomeBloc(getIt<HomeUseCase>()),
  );
}