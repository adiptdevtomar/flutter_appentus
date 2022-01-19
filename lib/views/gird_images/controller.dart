// Created by Adipt on 18/01/2022

part of 'view.dart';

final _stateProvider =
    StateNotifierProvider.autoDispose<_StateController, _State>((ref) {
  final stateController = _StateController();

  stateController.getImages();

  return stateController;
});

class _State {
  final bool isLoading;
  final List<GridImages> gridImages;

  _State({
    required this.isLoading,
    required this.gridImages,
  });

  _State.initial()
      : this(
          isLoading: true,
          gridImages: [],
        );

  _State copyWith({
    bool? isLoading,
    List<GridImages>? gridImages,
  }) {
    return _State(
      gridImages: gridImages ?? this.gridImages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class _StateController extends StateNotifier<_State> {
  _StateController() : super(_State.initial());

  getImages() async {
    try {
      List<GridImages> images = [];
      final dio = Dio();
      Response response = await dio.get('https://picsum.photos/v2/list');
      for (final element in response.data) {
        var obj = GridImages.fromJson(element);
        images.add(obj);
      }

      state = state.copyWith(
        gridImages: images,
      );
    } catch (e) {
      QAppX.extendedRouter.showToast(message: 'Some Error Occurred');
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }
}
