// ViewModelの格納先はChangeNotifierProviderとなる
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/model/step_model.dart';
import 'package:health_care/repository/step_repository.dart';

final stepViewModelProvider = ChangeNotifierProvider(
    (ref) => StepViewModel(repository: ref.read(stepRepositoryProvider)));

// ChangeNotifierを継承することで、呼び出し元に変更を通知することが可能
class StepViewModel extends ChangeNotifier {
  StepRepository? repository;
  StepViewModel({this.repository});

  Future fetchData() async {
    await repository?.fetchData().then(() => {
      notifyListeners()
    },);
  }

  Future addData() async {
    await repository?.addData().then(() => {
      notifyListeners()
    },);
  }

  Future fetchStepData() async {
    await repository?.fetchStepData().then(() => {
      notifyListeners()
    },);
  }
}
