import '../../models/poetry_model.dart';

abstract class HomeState {
  final List<PoetryModel> poetrys;
  HomeState(this.poetrys);
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(const []);
}

class HomeLoadingState extends HomeState {
  HomeLoadingState() : super(const []);
}

class HomeSucessState extends HomeState {
  HomeSucessState({required List<PoetryModel> poetrys}) : super(poetrys);
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState({required this.error}) : super(const []);
}
