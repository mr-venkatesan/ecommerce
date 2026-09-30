class AppApiConst {
  static const baseUrl = _BaseUrl();
  static const service = _Service();
  static const version = _Version();
  static const endpoint = _Endpoint();
}

class _BaseUrl {
  const _BaseUrl();

  final String localBaseUrl = "https://localhost:5000/";
  final String developmentBaseUrl = "https://api.dev.example.com/";
  final String productionBaseUrl = "https://api.prod.example.com/";
}

class _Service {
  const _Service();

  final String product = "products/";
}

class _Version {
  const _Version();

  final String v1 = "v1/";
}

class _Endpoint {
  const _Endpoint();

  String get getProductList =>
      "${AppApiConst.service.product}${AppApiConst.version.v1}list";
}
