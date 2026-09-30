import 'package:ecommerce/core/di/injection.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProvide {
  static final provide = [
    BlocProvider(create: (_) => getIt<HomeBloc>(), child: const HomePage()),
  ];
}
