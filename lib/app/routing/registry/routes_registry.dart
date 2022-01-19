// Created by Adipt on 17/01/2022

part of '../../extensions.dart';

class QRoutesRegistry {
  QRoutesRegistry._();

  static const List<AutoRoute<dynamic>> routes = <AutoRoute>[
    AutoRoute(
      path: '/loginView',
      page: LoginPage,
      initial: true,
    ),
    AutoRoute(
      path: '/signUpView',
      page: SignUpPage,
    ),
    AutoRoute(
      path: '/mapView',
      page: MapPage,
    ),
    AutoRoute(
      path: '/gridImageView',
      page: GridImagesPage,
    ),
  ];
}