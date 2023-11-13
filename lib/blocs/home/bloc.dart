import 'dart:async';

import 'package:poetizeme/api/poetry_api.dart';
import 'package:poetizeme/models/poetry_model.dart';

import '../../utils/result.dart';
import 'events.dart';
import 'states.dart';

class HomeBloc {
  final Poetry api;

  final StreamController<Event> _inputContentController = StreamController<Event>();
  final StreamController<HomeState> _outputContentController = StreamController<HomeState>.broadcast();

  Sink<Event> get inputContent => _inputContentController.sink;
  Stream<HomeState> get stream => _outputContentController.stream;

  HomeBloc(this.api) {
    _inputContentController.stream.listen(_mapEventToState);
  }

  void _handleResult(Result<List<PoetryModel>> result) {
    if (result.isSuccess) {
      _outputContentController.add(HomeSucessState(poetrys: result.value!));
    } else {
      _outputContentController.add(HomeErrorState(error: result.error!));
    }
  }

  _mapEventToState(Event event) async {
    if (event is LoadPoetryEvent) {
      Result<List<PoetryModel>> result = await _getPoetrys();
      _handleResult(result);
    }
  }

  Future<Result<List<PoetryModel>>> _getPoetrys() async {
    return api.getAll();
  }
}
