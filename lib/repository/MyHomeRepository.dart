import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/model/ResultModel.dart';

final myHomeRepositoryProvider = Provider(
    (ref) => MyHomeRepositoryImpl(model: ref.read(resultModelProvider)));

abstract class MyHomeRepository {
  Future<ResultModel> incrementCounter();
}

class MyHomeRepositoryImpl implements MyHomeRepository {
  MyHomeRepositoryImpl({required ResultModel model}) : _model = model;

  final ResultModel _model;

  @override
  Future<ResultModel> incrementCounter() {
    _model.counter = _model.counter + 1;
    return Future.value(_model);
  }
}
