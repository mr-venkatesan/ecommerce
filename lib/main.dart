import 'package:ecommerce/core/config/app_api_config.dart';
import 'package:ecommerce/core/routing/app_router.dart';
import 'package:ecommerce/shared/constants/app_bloc_provide.dart';
import 'package:ecommerce/shared/constants/app_router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection.dart';

void main() {
  setupDependencies();
  AppApiConfig.debugPrintConfig();
  runApp(MultiBlocProvider(providers: AppBlocProvide.provide, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouterPath.initial,
      onGenerateRoute: AppRouter.route,
    );
  }
}
