import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/model/step_model.dart';

final stepRepositoryProvider = Provider(
    (ref) => StepRepositoryImpl(model: ref.read(stepModelProvider)));

abstract class StepRepository {
  Future<StepModel> incrementCounter();
}

class StepRepositoryImpl implements StepRepository {
  StepRepositoryImpl({required StepModel model}) : _model = model;

  final StepModel _model;

  @override
  Future<StepModel> incrementCounter() {
    _model.counter = _model.counter + 1;
    return Future.value(_model);
  }
}
