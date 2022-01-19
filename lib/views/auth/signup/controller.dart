// Created by Adipt on 17/01/2022

part of './view.dart';

final _stateProvider =
    StateNotifierProvider.autoDispose<_StateController, _State>((ref) {
  final stateController = _StateController();

  return stateController;
});

class _State {
  final bool isLoading;
  final String email;
  final String name;
  final String password;
  final String phone;
  final Uint8List? image;
  final bool isPasswordVisible;

  _State({
    required this.isLoading,
    required this.password,
    required this.name,
    required this.phone,
    required this.email,
    required this.isPasswordVisible,
    this.image,
  });

  _State.initial()
      : this(
          isLoading: false,
          name: '',
          email: '',
          password: '',
          phone: '',
          isPasswordVisible: true,
          image: null,
        );

  _State copyWith({
    bool? isLoading,
    String? name,
    String? email,
    String? password,
    String? phone,
    Uint8List? image,
    bool? isPasswordVisible,
  }) {
    return _State(
      isLoading: isLoading ?? this.isLoading,
      password: password ?? this.password,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}

class _StateController extends StateNotifier<_State> {
  _StateController() : super(_State.initial());

  void onVisibilityChanged() {
    state = state.copyWith(
      isPasswordVisible: !state.isPasswordVisible,
    );
  }

  void onSelectingImage() async {
    ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      final image = await file.readAsBytes();
      state = state.copyWith(
        image: image,
      );
    }
  }

  void routeToLoginView() {
    QAppX.router.pop();
  }

  void onEmailChanged(String email) {
    state = state.copyWith(
      email: email,
    );
  }

  void onNameChanged(String name) {
    state = state.copyWith(
      name: name,
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: password,
    );
  }

  void onPhoneChanged(String phone) {
    state = state.copyWith(
      phone: phone,
    );
  }

  bool validEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _checkForm() {
    if (state.password == '' ||
        state.name == '' ||
        state.email == '' ||
        state.image == null ||
        state.phone == '') {
      QAppX.extendedRouter.showToast(message: 'Field cannot be left blank!');
      return false;
    } else if (!validEmail(state.email)) {
      QAppX.extendedRouter.showToast(message: 'Incorrect Email.');
      return false;
    } else {
      return true;
    }
  }

  void onSubmit() async {
    if (_checkForm()) {
      try {
        final user = User(
          phone: state.phone,
          image: state.image!,
          email: state.email,
          name: state.name,
          password: state.password,
        );
        final response = await QAppX.databaseHelper.saveUser(user);
        if (response == 0) {
          QAppX.extendedRouter.showToast(message: 'UserName Already Exists!');
        } else {
          QAppX.extendedRouter.showToast(message: 'User Created Successfully!');
          QAppX.router.pop();
        }
      } catch (e) {
        QAppX.extendedRouter.showToast(message: 'Some Error Occurred');
      }
    }
  }
}
