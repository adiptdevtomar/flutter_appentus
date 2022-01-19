// Created by Adipt on 17/01/2022

part of '../extensions.dart';

class QExtendedRouter {
  QExtendedRouter._();

  Future<bool?> showToast({required String message}) {
    final context = QAppX.router.navigatorKey.currentContext;

    return Fluttertoast.showToast(msg: message);
  }
}
