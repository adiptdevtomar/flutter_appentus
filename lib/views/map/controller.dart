// Created by Adipt on 18/01/2022

part of 'view.dart';

final _stateProvider =
    StateNotifierProvider.autoDispose<_StateController, _State>((ref) {
  final stateController = _StateController();

  stateController.determinePosition();

  return stateController;
});

class _State {
  final bool isLoading;

  _State({
    required this.isLoading,
  });

  _State.initial()
      : this(
          isLoading: true,
        );

  _State copyWith({
    bool? isLoading,
  }) {
    return _State(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class _StateController extends StateNotifier<_State> {
  _StateController() : super(_State.initial());

  final Completer<GoogleMapController> _controller = Completer();

  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(20.5937, 78.9629),
    zoom: 15,
  );

  void logout() {
    QSharedPreferences().clearUser();
    QAppX.router.replace(const LoginRoute());
  }

  void navigateToImagesPage() {
    QAppX.router.push(const GridImagesRoute());
  }

  void onMapCompleted(GoogleMapController controller) async {
    _controller.complete(controller);
    final location = await determinePosition();
    controller.animateCamera(CameraUpdate.newCameraPosition(location));
  }

  Future<CameraPosition> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    } catch (e) {
      QAppX.extendedRouter.showToast(message: e.toString());
    }

    var pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return CameraPosition(
      target: LatLng(pos.latitude, pos.longitude),
      zoom: 16,
    );
  }
}
