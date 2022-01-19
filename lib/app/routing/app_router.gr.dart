// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignUpPage());
    },
    MapRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MapPage());
    },
    GridImagesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const GridImagesPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/loginView', fullMatch: true),
        RouteConfig(LoginRoute.name, path: '/loginView'),
        RouteConfig(SignUpRoute.name, path: '/signUpView'),
        RouteConfig(MapRoute.name, path: '/mapView'),
        RouteConfig(GridImagesRoute.name, path: '/gridImageView')
      ];
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/loginView');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/signUpView');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [MapPage]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute() : super(MapRoute.name, path: '/mapView');

  static const String name = 'MapRoute';
}

/// generated route for
/// [GridImagesPage]
class GridImagesRoute extends PageRouteInfo<void> {
  const GridImagesRoute() : super(GridImagesRoute.name, path: '/gridImageView');

  static const String name = 'GridImagesRoute';
}
