// Created by Adipt on 17/01/2022

import 'package:appentus_flutter/app/routing/app_router.dart';
import 'package:appentus_flutter/data/user.dart';
import 'package:appentus_flutter/utils/database_helper.dart';
import 'package:appentus_flutter/views/auth/signup/view.dart';
import 'package:appentus_flutter/views/gird_images/view.dart';
import 'package:appentus_flutter/views/map/view.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../views/auth/login/view.dart';

part 'routing/registry/routes_registry.dart';
part 'routing/router.dart';
part 'routing/extended_router.dart';
part 'profile/profile.dart';

class QAppX{
  QAppX._();

  static BuildContext? get currentContext => router.navigatorKey.currentContext;

  static DatabaseHelper databaseHelper = DatabaseHelper.internal();

  static QExtendedRouter extendedRouter = QExtendedRouter._();

  static QProfile profile = QProfile._();

  static QRouter router = QRouter._();
}