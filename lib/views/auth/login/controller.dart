// Created by Adipt on 17/01/2022

part of './view.dart';

final _stateProvider =
    StateNotifierProvider.autoDispose<_StateController, _State>((ref) {
  final stateController = _StateController();

  stateController.init();

  return stateController;
});

class _State {
  final bool isLoading;
  final String email;
  final String password;

  _State({
    required this.isLoading,
    required this.email,
    required this.password,
  });

  _State.initial()
      : this(
          isLoading: true,
          email: '',
          password: '',
        );

  _State copyWith({
    bool? isLoading,
    String? email,
    String? password,
  }) {
    return _State(
      isLoading: isLoading ?? this.isLoading,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }
}

class _StateController extends StateNotifier<_State> {
  _StateController() : super(_State.initial());

  void init() async {
    final hasUser = await QSharedPreferences().hasUser();
    if (hasUser) {
      final email = await QSharedPreferences().getUser();
      final user = await QAppX.databaseHelper.getUser(email);
      QAppX.profile.saveUser(user: user!);
      /// TODO: Find Fix
      QAppX.router.replace(const MapRoute());
    }
    state = state.copyWith(
      isLoading: false,
    );
  }

  void routeToRegisterView() {
    QAppX.router.push(
      const SignUpRoute(),
    );
  }

  void onEmailChanged(String email) {
    state = state.copyWith(
      email: email,
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: password,
    );
  }

  void _saveUser(User user) async {
    QAppX.profile.saveUser(user: user);
    QSharedPreferences().saveUser(user.email);
    QAppX.router.replace(const MapRoute());
  }

  void onLogin() async {
    if (_checkForm()) {
      try {
        var user =
            await QAppX.databaseHelper.getLogin(state.email, state.password);
        if (user == null) {
          QAppX.extendedRouter
              .showToast(message: 'Incorrect Email or Password');
        } else {
          _saveUser(user);
        }
      } catch (e) {
        QAppX.extendedRouter.showToast(message: 'Some Error Occurred');
        print(e.toString());
      }
    }
  }

  bool _checkForm() {
    if (state.password == '' || state.email == '') {
      QAppX.extendedRouter.showToast(message: 'Field cannot be left blank!');
      return false;
    } else {
      return true;
    }
  }
}
