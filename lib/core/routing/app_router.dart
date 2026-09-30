import 'package:ecommerce/features/home/presentation/pages/home_page.dart';
import 'package:ecommerce/features/login/presentation/pages/login_page.dart';
import 'package:ecommerce/features/register/presentation/pages/register_page.dart';
import 'package:ecommerce/shared/constants/app_router_path.dart';
import 'package:ecommerce/shared/widgets/page_not_found.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? route(RouteSettings? routeSettings) {
    final routerName = routeSettings?.name;
    switch (routerName) {
      case AppRouterPath.initial:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const LoginPage(),
        );
      case AppRouterPath.login:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const LoginPage(),
        );
      case AppRouterPath.register:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const RegisterPage(),
        );
      case AppRouterPath.home:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const HomePage(),
        );
      case AppRouterPath.pageNotFound:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const PageNotFound(),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const PageNotFound(),
        );
    }
  }
}
