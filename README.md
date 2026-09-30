# Ecommerce Flutter App

A Flutter-based e-commerce application organized around **Clean
Architecture** and a feature-based structure. The project uses BLoC for
state management, Dio for API communication, Freezed for immutable types
and code generation, and GetIt for dependency injection.

## Tech Stack

-   **Flutter / Dart** --- cross-platform mobile application development
-   **BLoC (`flutter_bloc`)** --- state management
-   **Dio** --- HTTP client and API communication
-   **Freezed** --- immutable states and model generation
-   **json_serializable** --- JSON serialization
-   **GetIt** --- dependency injection

## Architecture

The project follows **Clean Architecture with a feature-based folder
structure**. Each feature contains its own data, domain, and
presentation layers. Shared infrastructure and reusable code are kept
outside individual features.

``` text
lib/
├── core/
│   ├── config/
│   ├── di/
│   ├── network/
│   ├── error/
│   └── ...
│
├── features/
│   └── feature_name/
│       ├── data/
│       │   ├── endpoints/
│       │   ├── models/
│       │   ├── request/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
│
├── shared/
│   ├── constants/
│   ├── widgets/
│   ├── components/
│   ├── themes/
│   ├── extensions/
│   ├── utils/
│   └── ...
│
└── main.dart
```

### Layer responsibilities

  -----------------------------------------------------------------------
Layer / folder                      Responsibility
  ----------------------------------- -----------------------------------
`presentation/`                     Screens, feature-specific widgets,
and BLoC events, states, and logic

`domain/`                           Business rules, entities,
repository contracts, and use cases

`data/`                             API endpoints, request/response
models, and repository
implementations

`core/config/`                      Environment and application
configuration

`core/di/`                          GetIt dependency registration

`core/network/`                     Dio client and network
configuration

`core/error/`                       Shared exception and error handling

`shared/constants/`                 Application-wide constants

`shared/widgets/`                   Reusable Flutter widgets

`shared/components/`                Common UI components

`shared/themes/`                    Colors, typography, and themes

`shared/extensions/`                Dart and Flutter extension methods

`shared/utils/`                     General-purpose helper functions
-----------------------------------------------------------------------

### Dependency rule

Dependencies should point inward toward the domain layer:

-   Presentation depends on Domain.
-   Data implements Domain repository contracts.
-   Domain should not depend on Flutter UI, Dio, or other outer-layer
    implementation details.
-   Core provides shared infrastructure, while Shared contains reusable
    code.

The folder structure supports Clean Architecture; keeping these
dependency boundaries intact is what makes the implementation follow its
principles.

## Environment Configuration

The API configuration uses an `ENV` compile-time variable. The default
environment is `local`.

``` dart
String.fromEnvironment('ENV', defaultValue: 'local')
```

Run the app with an environment value:

``` bash
flutter run --dart-define=ENV=local
flutter run --dart-define=ENV=development
flutter run --dart-define=ENV=production
```

Keep environment-specific base URLs in the existing API
constants/configuration files. Do not commit secrets such as private API
keys.

## Dependency Injection

GetIt is used to register and resolve dependencies. Register shared
services and repositories as lazy singletons, and create a fresh BLoC
for each provider when appropriate.

Example:

``` dart
final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<HomeEndpoint>(
    () => HomeEndpoint(),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeEndpoint>()),
  );

  getIt.registerLazySingleton<HomeUseCase>(
    () => HomeUseCase(getIt<HomeRepository>()),
  );

  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(getIt<HomeUseCase>()),
  );
}
```

Call `setupDependencies()` before `runApp()`. Adjust constructor names
and registrations to match the actual implementation.

## State Management

Use BLoC to keep UI rendering separate from business logic. Freezed can
define sealed state types.

Example state shape:

``` dart
@freezed
sealed class DemoApiState with _$DemoApiState {
  const factory DemoApiState.initial() = _Initial;
  const factory DemoApiState.getProductListLoading() =
      _GetProductListLoading;
  const factory DemoApiState.getProductListSuccess(
    List<ProductEntity> productList,
  ) = _GetProductListSuccess;
  const factory DemoApiState.getProductListError(
    String message,
  ) = _GetProductListError;
}
```

Generate the supporting files after adding or changing annotated
classes:

``` bash
dart run build_runner build --delete-conflicting-outputs
```

For a Freezed state, use the generated `map`/`when` APIs supported by
the installed Freezed version to render each state.

## API Communication

Dio handles HTTP requests. Keep endpoint calls in the data layer and
handle `DioException` consistently.

Example:

``` dart
Future<Response> getProductList() async {
  try {
    return await dio.get('/products');
  } on DioException catch (error) {
    throw Exception(DioErrorHandler.handle(error));
  }
}
```

`Response.data` contains the decoded response body. If the endpoint
method returns `Future<Response>`, return the `Response` object rather
than `response.data`.

### API response format

A consistent response envelope can use this structure:

``` json
{
  "success": true,
  "statusCode": 200,
  "message": "Request successful",
  "data": [],
  "error": null
}
```

`data` may contain an object, list, primitive value, or `null`,
depending on the endpoint. Parse it into the appropriate model in the
data layer. Keep transport errors and API-level errors distinguishable.

## Getting Started

### Prerequisites

-   Flutter SDK compatible with the Dart SDK constraint in
    `pubspec.yaml`
-   An editor such as Android Studio or VS Code
-   An emulator, simulator, or physical device

### Install dependencies

``` bash
flutter pub get
```

### Run the application

``` bash
flutter run
```

To select an environment, use the `--dart-define` examples above.

## Code Generation

Run code generation after changing Freezed or JSON-serializable
declarations:

``` bash
dart run build_runner build --delete-conflicting-outputs
```

For continuous generation during development:

``` bash
dart run build_runner watch --delete-conflicting-outputs
```

Keep code-generation tools such as `build_runner`, `freezed`, and
`json_serializable` in `dev_dependencies`. Runtime annotations such as
`freezed_annotation` belong in `dependencies`.

## Development Guidelines

-   Keep widgets focused on presentation.
-   Keep API calls out of widgets and BLoCs; access them through use
    cases and repositories.
-   Keep repository contracts in Domain and their implementations in
    Data.
-   Keep dependencies pointing inward toward Domain.
-   Use typed models rather than passing loosely typed JSON through the
    application.
-   Handle loading, success, empty, and error states in the UI.
-   Keep environment configuration centralized.
-   Register dependencies before the app starts.
-   Run code generation after modifying annotated source files.
-   Run `flutter analyze` and relevant tests before committing changes.

## Useful Commands

  ------------------------------------------------------------------------------------------------
Command                                                      Purpose
  ------------------------------------------------------------ -----------------------------------
`flutter pub get`                                            Install project dependencies

`flutter run`                                                Run the app

`flutter analyze`                                            Analyze Dart and Flutter code

`flutter test`                                               Run tests

`dart run build_runner build --delete-conflicting-outputs`   Generate Freezed/JSON files

`dart run build_runner watch --delete-conflicting-outputs`   Watch and regenerate files
------------------------------------------------------------------------------------------------

## License

Add the project's license and copyright details here.
