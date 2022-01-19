// Created by Adipt on 17/01/2022

import 'package:appentus_flutter/views/auth/signup/view.dart';
import 'package:appentus_flutter/views/gird_images/view.dart';
import 'package:appentus_flutter/views/map/view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../views/auth/login/view.dart';
import '../extensions.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: QRoutesRegistry.routes,
)
// extend the generated private router
class AppRouter extends _$AppRouter {}