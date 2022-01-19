// Created by Adipt on 18/01/2022

part of '../extensions.dart';

class QProfile {
  QProfile._();

  StateNotifierProvider<_CurrentProfileController, User?> get current =>
      _controller;

  final _userController = QAppX.currentContext!.read(
    _controller.notifier,
  );

  void saveUser({required User user}) {
    print(user);
    _userController.onLogIn(user: user);
  }
}

final _controller = StateNotifierProvider<_CurrentProfileController, User?>(
  (ref) {
    return _CurrentProfileController();
  },
);

class _CurrentProfileController extends StateNotifier<User?> {
  _CurrentProfileController() : super(null);

  void onLogIn({
    required User user,
  }) {
    state = user;
  }

  void onLogOut() async {
    state = null;
  }
}
