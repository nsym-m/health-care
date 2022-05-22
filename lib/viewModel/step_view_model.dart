// ViewModelの格納先はChangeNotifierProviderとなる
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/model/step_model.dart';
import 'package:health_care/repository/step_repository.dart';

final stepViewModelProvider = ChangeNotifierProvider(
    (ref) => StepViewModel(repository: ref.read(stepRepositoryProvider)));

// ChangeNotifierを継承することで、呼び出し元に変更を通知することが可能
class StepViewModel extends ChangeNotifier {
  StepViewModel({this.repository});
  StepRepository? repository;

  StepModel? _step;

  StepModel? get step => _step;

  Future<void> fetchStepData() async {
    _step?.state = AppState.STEPS_READY;
    notifyListeners();
    await repository
        ?.authorizetion()
        .then((value) => _step?.hasPermission = value);
    await repository?.fetchStepData().then(
          (value) => {
            _step?.steps = value.steps,
            _step?.state = AppState.STEPS_READY,
            notifyListeners()
          },
        );
  }
}
