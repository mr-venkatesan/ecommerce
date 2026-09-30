import 'package:ecommerce/shared/constants/app_api_const.dart';
import 'package:ecommerce/shared/enum/app_environment_enum.dart';
import 'package:flutter/material.dart';

class AppApiConfig {
  static final String _environment = String.fromEnvironment(
    "ENV",
    defaultValue: "local",
  );

  AppEnvironmentEnum get environment {
    switch (_environment) {
      case "local":
        return AppEnvironmentEnum.local;
      case "development":
        return AppEnvironmentEnum.development;
      case "production":
        return AppEnvironmentEnum.production;
      default:
        return AppEnvironmentEnum.local;
    }
  }

  String get baseUrl {
    switch (environment) {
      case AppEnvironmentEnum.local:
        return AppApiConst.baseUrl.localBaseUrl;
      case AppEnvironmentEnum.development:
        return AppApiConst.baseUrl.developmentBaseUrl;
      case AppEnvironmentEnum.production:
        return AppApiConst.baseUrl.productionBaseUrl;
    }
  }

  static void debugPrintConfig() {
    assert(() {
      debugPrint('Environment: ${AppApiConfig().environment.name}');
      debugPrint('Base URL: ${AppApiConfig().baseUrl}');
      return true;
    }());
  }
}
